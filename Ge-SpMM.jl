# Derived from work done in the paper:
#  "Ge-SpMM: ..." by Huang et al. - 2020 (https://arxiv.org/pdf/2007.03179.pdf)  https://arxiv.org/pdf/2007.03179.pdf
# Julia Code by:
#     Mattieu ?
#     Andrew Osterhout
using CUDA
using Random



"""
Convert a sparse matrix or 2D array of some sort to a CRC representation of a matrix.
Meaning that it contains a `rowPtr`, `colInd`, and `val` 1D arrays 
 that represent the matrix but more compact and memory efficient.
"""
function to_CRC(A) # This gave the CRC representation from a matrice A ie. the 3 vectors rowPtr, colInd and values
    rowPtr = [] # Array{Int32,1}()
    colInd = [] # Array{Int32,1}()
    val = [] # Array{Float64,1}()
    for i = 1:size(A, 1)
        append!(rowPtr, (size(val, 1) + 1))
        for j = 1:size(A, 2)
            if A[i,j] != 0
                append!(colInd, j)
                append!(val, A[i,j])
            end
        end
    end
    append!(rowPtr, size(val, 1) + 1)
    return (rowPtr=rowPtr, col_nd=colInd, val=val)
end #? function to_CRC(A)



"""
A linear/singlethreaded version of the Ge-SpMM algortihm (meant for CPU not GPU)
 _(algorithm 1 in [the paper](https://arxiv.org/pdf/2007.03179.pdf))_.
"""
function SpMM_lin(M, N, rowPtr, colInd, val, B)
    C = Matrix{Float64}(undef, M, N)
    for i in 1:M
        for j in 1:N
            result = 0
            for ptr in rowPtr[i]:(rowPtr[i + 1] - 1)
                k = colInd[ptr]
                result += val[ptr] * B[k,j]
            end
            C[i,j] = result
        end
    end
    return C
end #? function SpMM_lin(N, M, rowPtr, colInd, val, B)




"""
The parrallel CUDA version of the Ge-SpMM algorithm
 _(algorithm 2 in [the paper](https://arxiv.org/pdf/2007.03179.pdf))_.
"""
function SpMM(  rowPtr::CuDeviceVector{Int32,1}, 
                colInd::CuDeviceVector{Int32,1}, 
                val::CuDeviceVector{Float64,1}, 
                B::CuDeviceMatrix{Float64,1}, 
                C::CuDeviceMatrix{Float64,1}#= , 
                sm_k::CuDeviceVector{Int32,1}, 
                sm_v::CuDeviceVector{Float64,1} =#) # This correspond to algo2 of the paper
    warp_size = warpsize() 
    tid = threadIdx().x
    tb_id = blockIdx().x
    tb_dim = blockDim().x
    i = tb_id
    j = tid
    lane_id = (j - 1) % warp_size 
    sm_bBase = tb_dim*(i-1)
    sm_base = sm_bBase + (j - lane_id)
    row_start = rowPtr[i]
    row_end = rowPtr[i + 1] 
    result::Float64 = 0.0
    sm_k = @cuStaticSharedMem(Int32, 4096)
    sm_v = @cuStaticSharedMem(Float64, 4096)
    for ptr in row_start:warp_size:(row_end - 1)    
        if ptr + lane_id < row_end            
            sm_k[sm_bBase+j] = colInd[ptr + lane_id]
            sm_v[sm_bBase+j] = val[ptr + lane_id]
            # sm_k[tid + (tb_id - 1) * tb_dim] = colInd[ptr + lane_id]
            # sm_v[tid + (tb_id - 1) * tb_dim] = val[ptr + lane_id]
        end
        CUDA.sync_warp()
        for kk in 0:(warp_size - 1)
            if (ptr + kk <= (row_end - 1))
                k = sm_k[sm_base + kk]
                result += sm_v[sm_base + kk] * B[k,j]
                # k = sm_k[sm_base + kk + (tb_id - 1) * tb_dim]
                # result += sm_v[sm_base + kk + (tb_id - 1) * tb_dim] * B[k,j]
            end
        end
        CUDA.sync_warp()
    end
    C[i,j] = result
    return nothing
end #? function SpMM(rowPtr, colInd, val, B, C, sm_k, sm_v)


"""
A linear/singlethreaded version of the Ge-SpMM loop unrolled algortihm (meant for CPU not GPU)
 _(addapted from algorithm 3 in [the paper](https://arxiv.org/pdf/2007.03179.pdf))_.
"""
function SpMM2_lin(N, M, rowPtr, colInd, val, B; warp_size=32)
    C = zeros(N, size(B, 2))
    tb_dim = M
    sm_k = Array{Int32,1}(undef, tb_dim)
    sm_v = Array{Float64,1}(undef, tb_dim)
    for i in 1:N
        row_start = rowPtr[i]
        row_end = rowPtr[i + 1]
        for jj in 1:warp_size:(M ÷ 2)
            for j in jj:(jj + warp_size - 1)
                lane_id = (j - 1) % warp_size
                for ptr in row_start:warp_size:(row_end - 1)
                    if ptr + lane_id < row_end            
                        sm_k[j] = colInd[ptr + lane_id]
                        sm_v[j] = val[ptr + lane_id]
                    end
                end
            end
        # CUDA.sync_warp()
            for j in jj:(jj + warp_size - 1)
                lane_id = (j - 1) % warp_size
                sm_base = j - lane_id
                result_1::Float64 = 0.0
                result_2::Float64 = 0.0
                for ptr in row_start:warp_size:(row_end - 1)
                    for kk in 0:warp_size
                        if ptr + kk <= (row_end - 1) 
                            k = colInd[ptr + kk]
                            result_1 += sm_v[sm_base + kk] * B[k,j]
                            result_2 += sm_v[sm_base + kk] * B[k,j + warp_size]
                        end
                    end
                end
                C[i,j] = result_1
                C[i,j + warp_size] = result_2
                # println("\n"*
                #         "[DEBUG]  :: dubug output for `SpMM2_lin` \n"*
                #         "         ::\ti: $(i), jj: $(jj), j: $(j) \n"*
                #         "         ::\tC[$(i),$(j)]: $(result_1)\n"*
                #         "         ::\tC[$(i),$(j+warp_size)]: $(result_2)\n"*
                #         "         ::\tC: $(C)\n"*
                #         "         :: [END]\n")
            end
        end
    end
    return C
end	# ? function SpMM2_lin(N,M, rowPtr, colInd, val, B) 



"""
The parrallel CUDA version of the Ge-SpMM loop unrolled algortihm
 _(algorithm 2 in [the paper](https://arxiv.org/pdf/2007.03179.pdf))_.
"""
function SpMM2(rowPtr, colInd, val, B, C, sm_k, sm_v)
    warp_size = CUDA.warpsize() 
    j = CUDA.threadIdx().x
    i = CUDA.blockIdx().x
    tb_dim = CUDA.blockDim().x
    lane_id = (j - 1) % warp_size 
    sm_bBase = tb_dim*(i-1)
    sm_base = sm_bBase + (j - lane_id)
    row_start = rowPtr[i]
    row_end = rowPtr[i + 1]
    result_1::Float64 = 0.0
    result_2::Float64 = 0.0
    # sm_k = CUDA.CuDeviceArray{Int32}(tb_dim)
    # sm_v = CUDA.CuDeviceArray{Float64}(tb_dim)
    for ptr in row_start:warp_size:(row_end - 1)
        if (ptr+lane_id < row_end)            
            sm_k[sm_bBase+j] = colInd[ptr+lane_id]
            sm_v[sm_bBase+j] = val[ptr+lane_id]
        end #? if (ptr + lane_id < row_end)
        CUDA.sync_warp()
        for kk in 0:warp_size
            if (ptr + kk <= (row_end - 1))
                k = sm_k[sm_base+kk]
                result_1 += sm_v[sm_base+kk] * B[k,j]
                result_2 += sm_v[sm_base+kk] * B[k,j+warp_size]
            end #? if (ptr + kk <= (row_end - 1))
        end #? for kk in 0:warp_size
    end #? for ptr in row_start:warp_size:(row_end - 1)
    C[i,j] = result_1
    C[i,j+warp_size] = result_2
    return nothing
end	#? function SpMM2(rowPtr, colInd, val, B, C, sm_k, sm_v)

