# Derived from CUDA-C code in https://github.com/hgyhungry/ge-spmm
# In regards to the paper "Ge-SpMM: ..." by Huang et al. - 2020 (https://arxiv.org/pdf/2007.03179.pdf)
# Julia Code by: Andrew Osterhout 

using CUDA

include("Ge-SpMM_testHelpers.jl")

function SpMM_der0(  M::Int, K::Int, N::Int,
                A_rowPtr::CuDeviceVector{Int,1},
                A_colInd::CuDeviceVector{Int,1},
                A_val::CuDeviceVector{Float64,1},
                B::CuDeviceMatrix{Float64,1},
                C::CuDeviceMatrix{Float64,1},
                tile_row::Int=8                     )#=::nothing=# # where {T}
    rid::Int = blockDim().y * blockIdx().x + threadIdx().y
    if rid <= M
        cid::Int = (blockIdx().y << 5) + threadIdx().x
        ln::Int = A_rowPtr[rid]
        hb::Int = A_rowPtr[rid+1]
        offset::Int = 0
        acc::Float64 = 0.0
        if blockIdx().y != gridDim().y
            for ptr in ln:hb
                # offset = A_colInd[ptr] * N + cid
                # acc += A_val[ptr] * B[offset]
                offset = A_colInd[ptr] * N + cid
                acc += A_val[ptr] * B[offset]
            end	#? for ptr in ln:hb 
            # C[rid*N+cid] = acc
            C[rid,cid] = acc
        else
            for ptr in ln:hb
                if cid <= N
                    # offset = A_colInd[ptr] * N + cid
                    # acc += A_val[ptr] * B[offset]
                    offset = A_colInd[ptr]
                    acc += A_val[ptr] * B[offset, cid]
                end #? if cid <= N
            end	#? for ptr in ln:hb 
            # C[rid*N+cid] = acc
            C[rid,cid] = acc
        end #? if blockIdx().y != gridDim().y ... else ...
    end #? if rid <= M
    # @cuprintln("[DBG] :: C[$rid,$cid] = $(C[rid,cid])")
    return nothing
end #? function SpMM_der0(M,K,N, A_rowPtr, A_colInd, A_val, B, C, tile_row)


_warpsize = CUDA.warpsize(CUDA.device())


function _Test__SpMM_der0(dims, doRand; FP_TOL::Float64=0.0001, verbose::Bool=false, tile_row::Int=8)
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

    # - Move data around 
    @sync begin # Matrix Data
        @async begin # rowPtr_d
            copyto!(rowPtr_d, A_CRC[1])
            nothing # JuliaLang/julia#40626
        end #? @async rowPtr_d
        @async begin # colInd_d
            copyto!(colInd_d, A_CRC[2])
            nothing # JuliaLang/julia#40626
        end #? @async colInd_d
        @async begin # val_d
            copyto!(val_d, A_CRC[3])
            nothing # JuliaLang/julia#40626
        end #? @async val_d
        @async begin # B_d
            copyto!(B_d, B)
            nothing # JuliaLang/julia#40626
        end #? @async B_d
    end #? @sync

    # - Run the test 
    blks = ((M+tile_row-1)÷tile_row, 1, 1)
    thds = (N, tile_row, 1)
    # smem = (_warpsize*tile_row*(sizeof(Int)+sizeof(Float64)))
    # @device_code_warntype 
    @sync begin # Kernel Call
        @async begin # kernel call
            @cuda blocks=blks threads=thds SpMM_der0(M,K,N, rowPtr_d, colInd_d, val_d, B_d, C_d, tile_row)
            nothing # JuliaLang/julia#40626
        end #? @async # kernel call
    end #? @sync Kernel Call
    @sync begin # Retrieve Results
        @async begin # retrieve resutls
            copyto!(C, C_d)
            nothing # JuliaLang/julia#40626
        end #? @async retrieve results
    end #? @sync # Retrieve Results
    

    # - evaluate the test
    _test_results_array = (-FP_TOL .< (C - (A * B)) .< FP_TOL)   # We must compare it this way because of floating operation errors. Could be interesting to understand why the calculus are different.
    _test_result = all(_test_results_array)
    if !verbose
        return _test_result
    end
    if !_test_result
        println("""
[TEST-FAIL] :: Ge-SpMM's Algorithm 0 implimentation (`SpMM`) did NOT produce the right answer on GENERATED data !!
            ::\tdims: (M: $M, K: $K, N: $N)
            :: \tFP Tollerance: $(FP_TOL)
            :: \t Result Array: $(getShowString_log(_test_results_array))
            :: [END]
                """)
        return false
    else 
        println("""
[TEST-PASS] :: Ge-SpMM's Algorithm 0 implimentation (`SpMM`) DID produce the right answer on GENERATED data !!
            ::\tdims: (M: $M, K: $K, N: $N)
            :: [END]
            """) 
        return true
    end
end	# ? function _Test__SpMM(N,M, A_CRC, B)



