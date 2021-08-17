#https://arxiv.org/pdf/2007.03179.pdf
using CUDA
using Random # to generate our sparse Matrix
using Test

N = 64
sparse_ratio = 0.01
TEST_FP_TOLLERANCE = 0.001

A = Matrix{Float64}(undef, N, N)
B = randexp(N, N)
C = Matrix{Float64}(undef, N, N)

for i in 1:N #we randomly fill matrice A.
    for j in 1:N
        if rand(1:N*N) <= N*N*sparse_ratio
            A[i,j] = rand(Float64)
        else
            A[i,j] = 0
        end
    end
end
# println("Matrix A:\n$(A)")


function to_CRC(A) #This gave the CRC representation from a matrice A ie. the 3 vectors rowPtr, colInd and values
    rowPtr = []
    colInd = []
    val = []    
    for i = 1:size(A,1)
        append!(rowPtr, (size(val,1) + 1))
        for j = 1:size(A,2)
            if A[i,j] != 0
                append!(colInd, j)
                append!(val, A[i,j])
            end
        end
        append!(rowPtr, size(val,1))
    end
    # append!(rowPtr, (size(val,1) + 1))
    return rowPtr, colInd, val
end

function SpMM(rowPtr, colInd, val, B, C, sm_k, sm_v) #This correspond to algo2 of the paper
    warp_size = warpsize() 
    tid = threadIdx().x
    tb_id = blockIdx().x
    tb_dim = blockDim().x
    i = tb_id
    j = tid
    lane_id = (tid-1) % warp_size 
    sm_base = tid - lane_id
    row_start = rowPtr[i]
    row_end = rowPtr[i+1]-1
    result = 0
    for ptr in row_start:warp_size:row_end     
        if ptr+lane_id < row_end            
            sm_k[tid + (tb_id-1) * tb_dim] = colInd[ptr+lane_id]
            sm_v[tid + (tb_id-1) * tb_dim] = val[ptr+lane_id]
        end
        CUDA.sync_warp()
        for kk in 0:(warp_size-1)
            if ptr+kk < row_end
                k = sm_k[sm_base+kk + (tb_id-1) * tb_dim]
                result += sm_v[sm_base+kk + (tb_id-1) * tb_dim] * B[k,j]
            end
        end
    end
    C[i,j] = result
    return nothing
end

function SpMM2(rowPtr, colInd, val, B, C, sm_k, sm_v) #This intends to implement algo3 of the paper
    warp_size = warpsize() #32 is C Cuda Warp_size (seems to be the same here)
    j = threadIdx().x
    i = blockIdx().x
    tb_dim = blockDim().x
    # i = tb_id
    # j = tid
    lane_id = (j-1) % warp_size 
    sm_base = j - lane_id
    row_start = rowPtr[i]
    row_end = rowPtr[i+1]
    result_1 = 0
    result_2 = 0
    for ptr in row_start:warp_size:row_end     
        if ptr+lane_id < row_end            
            sm_k[j + (i-1) * tb_dim] = colInd[ptr+lane_id]
            sm_v[j + (i-1) * tb_dim] = val[ptr+lane_id]
        end
        CUDA.sync_warp()
        for kk in 0:warp_size-1 
            k = sm_k[sm_base+kk + (i-1) * tb_dim]
            result_1 += sm_v[sm_base+kk + (i-1) * tb_dim] * B[k,j]
            result_2 += sm_v[sm_base+kk + (i-1) * tb_dim] * B[k,j+warp_size]
        end
    end
    C[i,j] = result_1
    C[i,j+warp_size] = result_2
    return nothing
end

A_CRC = to_CRC(A)

# init of every device ressources

sm_k = CuArray{Int32}(undef, N*N)

sm_v = CuArray{Float64}(undef, N*N)

rowPtr_d = CuArray{Int32}(undef, size(A_CRC[1],1))
colInd_d = CuArray{Int32}(undef, size(A_CRC[2],1))
val_d = CuArray{Float64}(undef, size(A_CRC[3],1))

B_d = CuArray{Float64}(undef, (N,N))
C_d1 = CuArray{Float64}(undef, (N,N))
C_d2 = CuArray{Float64}(undef, (N,N))

# copying data to the device

copyto!(rowPtr_d, A_CRC[1])
copyto!(colInd_d, A_CRC[2])
copyto!(val_d, A_CRC[3])
copyto!(B_d, B)

@cuda threads=N blocks=N SpMM(rowPtr_d, colInd_d, val_d, B_d, C_d1, sm_k, sm_v)

# copying data back from the device

copyto!(C, C_d1)


_test_results_array = C - A*B .< TEST_FP_TOLLERANCE   #We must compare it this way because of floating operation errors. Could be interesting to understand why the calculus are different.
_test_result = (_test_results_array == ones(N,N))
if !_test_result
    println("""
[TEST-FAILED]\t:: Ge-SpMM's algorithm 2 implimentation (`SpMM`) did not produce the right answer.
                \t:: \tFP Tollerance: $(TEST_FP_TOLLERANCE)
                \t:: \t Result Array: $(_test_results_array)
                """)
end
@test (_test_result) 

# @cuda threads=N÷2 blocks=N SpMM2(rowPtr_d, colInd_d, val_d, B_d, C_d2, sm_k, sm_v) #This is not working yet

# @test (C_d1 == C_d2)
