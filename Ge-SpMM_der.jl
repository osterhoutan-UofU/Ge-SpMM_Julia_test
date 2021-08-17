# Derived from CUDA-C code in https://github.com/hgyhungry/ge-spmm
# In regards to the paper "Ge-SpMM: ..." by Huang et al. - 2020 (https://arxiv.org/pdf/2007.03179.pdf)
# Julia Code by: Andrew Osterhout 

using CUDA

include("Ge-SpMM_testHelpers.jl")

function SpMM_der(  M::Int, K::Int, N::Int,
                A_rowPtr::CuDeviceVector{Int,1},
                A_colInd::CuDeviceVector{Int,1},
                A_val::CuDeviceVector{T,1},
                B::CuDeviceMatrix{T,1},
                C::CuDeviceMatrix{T,1};
                tile_row::Int=8                     )::nothing where {T}
    colInd_sh = @cuDynamicSharedMem(Int, 32*tile_row)
    val_sh    = @cuDynamicSharedMem(T, 32*tile_row, (threadIdx().y<<5))
    shmem_offset = (threadIdx().y<<5)
    thread_idx = shmem_offset+threadIdx().x
    rid = blockDim().y*blockIdx().x+threadIdx().y

    if (rid <= M)
        cid = (blockIdx().y<<5)+threadIdx().x
        lb = A_rowPtr[rid]
        hb = A_rowPtr[rid+1]
        ptr = lb+threadIdx().x
        offset = 0
        acc::T = 0

        if (blockIdx().y != gridDim().y-1)
            for jj in lb:warpsize():(hb-1)
                if (ptr<hb)
                    val_sh[thread_idx]    = A_val[ptr]
                    colInd_sh[thread_idx] = A_colInd[ptr]
                end
                CUDA.sync_warp()
                ptr += 32

                for kk in 0:(warpsize-1)
                    if (jj+kk < hb) #= then =# break end
                    offset = colInd_sh[shmem_offset+kk]
                    acc += val_sh[shmem_offset+kk] * B[offset, cid]
                end	#? for kk in 0:(warpsize-1) 
                CUDA.sync_warp()
            end	#? for jj in lb:warpsize():(hb-1) 
            C[rid,cid] = acc

        else
            for jj in lb:warpsize():(hb-1)
                if (ptr<hb)
                    val_sh[thread_idx]    = A_val[ptr]
                    colInd_sh[thread_idx] = A_colInd[ptr]
                end
                CUDA.sync_warp()
                ptr += 32

                for kk in 0:(warpsize-1)
                    if (jj+kk < hb) #= then =# break end
                    offset = colInd_sh[shmem_offset+kk]
                    if (cid<=N)
                        acc += val_sh[shmem_offset+kk] * B[offset, cid]
                    end
                end	#? for kk in 0:(warpsize-1) 
                CUDA.sync_warp()
            end	#? for jj in lb:warpsize():(hb-1) 
            if (cid<=N)
                C[rid,cid] = acc
            end
        end #? if (blockIdx().y != gridDim().y-1) ... else
    end #? if (rid < M)
    return nothing
end #? function SpMM



function _Test__SpMM_der(dims, doRand; FP_TOL::Float64=0.0001, verbose::Bool=false, tile_row::Int=8)
    M::Int, K::Int, N::Int, SR = dims
    A = genSpM(dims.M, dims.K, sparse_ratio=dims.SR, doRand=doRand)
    A_CRC = to_CRC(A)
    B = genSpM(dims.K, dims.N, doRand=doRand)
    C = Matrix{Float64}(undef, M, N)
    # - init of every device ressources
    # sm_k = CuArray{Int}(undef, M*N)
    # sm_v = CuArray{Float64}(undef, M*N)

    rowPtr_d = CuArray{Int}(undef, size(A_CRC[1], 1))
    colInd_d = CuArray{Int}(undef, size(A_CRC[2], 1))
    val_d = CuArray{Float64}(undef, size(A_CRC[3], 1))

    B_d = CuArray{Float64}(undef, (K, N))
    C_d = CuArray{Float64}(undef, (M, N))

    # - copying data to the device
    copyto!(rowPtr_d, A_CRC[1])
    copyto!(colInd_d, A_CRC[2])
    copyto!(val_d, A_CRC[3])
    copyto!(B_d, B)

    # - Run the test
    @cuda blocks = ((M+tile_row-1)÷tile_row, (N+warpsize()-1)÷warpsize(), 1) threads = (32, tile_row, 1) shmem = (warpsize()*tile_row*(sizeof(Int)+sizeof(Float64))) SpMM_der(M,K,N, rowPtr_d, colInd_d, val_d, B_d, C_d)
    copyto!(C, C_d)

    # - evaluate the test
    _test_results_array = (-FP_TOL .< (C - (A * B)) .< FP_TOL)   # We must compare it this way because of floating operation errors. Could be interesting to understand why the calculus are different.
    _test_result = all(_test_results_array)
    if !verbose
        return _test_result
    end
    if !_test_result
        println("""
[TEST-FAIL] :: Ge-SpMM's Algorithm 2 implimentation (`SpMM`) did NOT produce the right answer on GENERATED data !!
            ::\tdims: (M: $M, K: $K, N: $N)
            :: \tFP Tollerance: $(FP_TOL)
            :: \t Result Array: $(getShowString_log(_test_results_array))
            :: [END]
                """)
        return false
    else 
        println("""
[TEST-PASS] :: Ge-SpMM's Algorithm 2 implimentation (`SpMM`) DID produce the right answer on GENERATED data !!
            ::\tdims: (M: $M, K: $K, N: $N)
            :: [END]
            """) 
        return true
    end
end	# ? function _Test__SpMM(N,M, A_CRC, B)



