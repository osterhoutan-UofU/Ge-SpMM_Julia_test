# https://arxiv.org/pdf/2007.03179.pdf
using CUDA
using Random # to generate our sparse Matrix
using Test

N                   = 64
M                   = 64
SPARSE_RATIO        = 0.01
TEST_FP_TOLLERANCE  = 0.001



#= Test Data =#
A_4Test             =  [  0  0  0  4
                          0  0  7  0
                          9  0 11 12
                          0 14 15  0 ]
A_4Test_rowPtr      = [ 1,    2,    3,          6,      8]
A_4Test_colInd      = [    4,    3,    1, 3, 4,    2, 3  ]
A_4Test_val         = [    4,    7,    9,11,12,   14,15  ]

B_4Test             =  [ 1  2  3  4
                         5  6  7  8
                         9 10 11 12
                        13 14 15 16 ]

C_4Test             =  [ 52.0  56.0  60.0  64.0
                         63.0  70.0  77.0  84.0
                        264.0 296.0 328.0 360.0
                        205.0 234.0 263.0 292.0 ]
# C_4Test             = [  90  100  110  120
#                         202  228  254  280
#                         314  356  398  440
#                         426  484  542  600 ]


function genSpM(N::Int,M::Int=Nothing; sparse_ratio::Float64=1.0, doRand::Bool=true)
    A = Matrix{Float64}(undef, (N,M))
    M = (isnothing(M)) ? N : M
    for i in 1:N # we randomly fill matrice A.
        for j in 1:M
            if rand(1:N * M) <= N * M * sparse_ratio
                A[i,j] = (doRand) ? rand(Float64) : ((i - 1) * N + (j - 1))
            else
                A[i,j] = 0
            end
        end
    end
    return A
end # function genSpMgenSpM(N::Int, M::Int, sparse_ratio::Float64=1.0, doRand::Bool=true)


# << Generate SpM in CRC format >> #
function to_CRC(A) # This gave the CRC representation from a matrice A ie. the 3 vectors rowPtr, colInd and values
    rowPtr = [] # Array{Int,1}()
    colInd = [] # Array{Int,1}()
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
    return rowPtr, colInd, val
end


# << TEST `to_CRC` >> #
_rowPtr, _colInd, _val = to_CRC(A_4Test)
println("\nCRC rep for: $(A_4Test)\n\trowPtr: $(_rowPtr)\n\tcolInd: $(_colInd)\n\tval:    $(_val)\n")
@test (_rowPtr == A_4Test_rowPtr)
@test (_colInd == A_4Test_colInd)
@test (_val == A_4Test_val)



# << Ge-SpMM Algorithm 1 >> #
function SpMM_lin(N, M, rowPtr, colInd, val, B)
    C = Matrix{Float64}(undef, N, size(B, 2))
    for i in 1:N
        for j in 1:M
            result = 0
            for ptr in rowPtr[i]:(rowPtr[i + 1] - 1)
                k = colInd[ptr]
                result += val[ptr] * B[k,j]
            end
            C[i,j] = result
        end
    end
    return C
end



# << Test Algo 1 (`SpMM_lin`) >> #
function _Test_Algo1_known()
    _C_4Test = SpMM_lin(4, 4, A_4Test_rowPtr, A_4Test_colInd, A_4Test_val, B_4Test)
    
    _test_results_array = ones(Bool, 4, 4)
    for i in 1:4
        for j in 1:4
            _test_results_array[i,j] = (_C_4Test[i,j] == C_4Test[i,j])
        end
    end
    _test_result = (_test_results_array == ones(Bool, 4, 4))
    if _test_result
        println("""
[TEST-PASS] :: Ge-SpMM's Algorithm 1 implimentation (`SpMM_lin`) DID produce the right answer on KNOWN data !!
            :: [END]
                """) 
    else 
        println("""
[TEST-FAIL] :: Ge-SpMM's Algorithm 1 implimentation (`SpMM_lin`) did NOT produce the right answer on KNOWN data !!
            :: \tFP Tollerance: $(TEST_FP_TOLLERANCE)
            :: \t Result Array: $(_test_results_array)
            :: [END]
             """)
        # @test (_test_result)
    end
end	# ? function _Test_Algo1_known() 
# _Test_Algo1_known()



# << Create common GENERATED data >> #
A = genSpM(N, M, sparse_ratio=SPARSE_RATIO, doRand=true)
B = genSpM(N, M, doRand=true)


A_CRC = to_CRC(A)


# << Test Algo 1 (`SpMM_lin`) >> #
function _Test_Algo1_gen(N, M, A_CRC, B)
    C = SpMM_lin(N, M, A_CRC[1], A_CRC[2], A_CRC[3], B)
    _test_results_array = (C - (A * B) .< TEST_FP_TOLLERANCE)   # We must compare it this way because of floating operation errors. Could be interesting to understand why the calculus are different.
    _test_result = (_test_results_array == ones(N, M))
    if _test_result
        println("""
[TEST-PASS] :: Ge-SpMM's Algorithm 1 implimentation (`SpMM_lin`) DID produce the right answer on GENERATED data !!
            :: [END]
                """)
    else 
        println("""
[TEST-FAIL] :: Ge-SpMM's Algorithm 1 implimentation (`SpMM_lin`) did not produce the right answer on GENERATED data !!
            :: \tFP Tollerance: $(TEST_FP_TOLLERANCE)
            :: \t Result Array: $(_test_results_array)
            :: [END]
             """)
        # @test (_test_result)
    end
end	# ? function _Test_Algo1_gen(N,M, A_CRC, B) 
# _Test_Algo1_gen(N,N, A_CRC, B)



# << Ge-SpMM Algorithm 2 >> #
function SpMM(rowPtr, colInd, val, B, C, sm_k, sm_v) # This correspond to algo2 of the paper
    warp_size = warpsize() 
    tid = threadIdx().x
    tb_id = blockIdx().x
    tb_dim = blockDim().x
    i = tb_id
    j = tid
    lane_id = (tid - 1) % warp_size 
    sm_base = tid - lane_id
    row_start = rowPtr[i]
    row_end = rowPtr[i + 1] 
    result = 0
    for ptr in row_start:warp_size:(row_end - 1)    
        if ptr + lane_id < row_end            
            sm_k[tid + (tb_id - 1) * tb_dim] = colInd[ptr + lane_id]
            sm_v[tid + (tb_id - 1) * tb_dim] = val[ptr + lane_id]
        end
        CUDA.sync_warp()
        for kk in 0:(warp_size - 1)
            if ptr + kk < row_end
                k = sm_k[sm_base + kk + (tb_id - 1) * tb_dim]
                result += sm_v[sm_base + kk + (tb_id - 1) * tb_dim] * B[k,j]
            end
        end
    end
    C[i,j] = result
    return nothing
end



# << Test Algo 2 on GPU w/ KNOWN data >> # 
function _Test_Algo2_known(N, M, A_CRC, B)
    C = Matrix{Float64}(undef, N, size(B, 2))
    # - init of every device ressources
    sm_k = CuArray{Int}(undef, N * M)
    sm_v = CuArray{Float64}(undef, N * M)

    rowPtr_d = CuArray{Int}(undef, size(A_CRC[1], 1))
    colInd_d = CuArray{Int}(undef, size(A_CRC[2], 1))
    val_d = CuArray{Float64}(undef, size(A_CRC[3], 1))

    B_d = CuArray{Float64}(undef, (N, M))
    C_d1 = CuArray{Float64}(undef, (N, M))

    # - copying data to the device
    copyto!(rowPtr_d, A_CRC[1])
    copyto!(colInd_d, A_CRC[2])
    copyto!(val_d, A_CRC[3])
    copyto!(B_d, B)

    # - Run the test
    @cuda threads = N blocks = M SpMM(rowPtr_d, colInd_d, val_d, B_d, C_d1, sm_k, sm_v)
    copyto!(C, C_d1)

    # - evaluate the test
    _test_results_array = ones(Bool, 4, 4)
    for i in 1:4
        for j in 1:4
            _test_results_array[i,j] = (C[i,j] == C_4Test[i,j])
        end
    end
    _test_result = (_test_results_array == ones(N, M))
    if !_test_result
        println("""
[TEST-FAIL] :: Ge-SpMM's Algorithm 2 implimentation (`SpMM`) did NOT produce the right answer on KNOWN data !!
            :: \tFP Tollerance: $(TEST_FP_TOLLERANCE)
            :: \t Result Array: 
$(_test_results_array)
            :: [END]
                """)
    else 
        println("""
[TEST-PASS] :: Ge-SpMM's Algorithm 2 implimentation (`SpMM`) DID produce the right answer on KNOWN data !!
            :: [END]
            """) 
        # @test (_test_result) 
    end
end	# ? function _Test_Algo2_knwon(N,M, A_CRC, B) 
# _Test_Algo2_known(4,4, (A_4Test_rowPtr,A_4Test_colInd,A_4Test_val), B_4Test)


# << Test Algo 2 on GPU w/ GENERATED data >> #
function _Test_Algo2(N, M, A_CRC, B)
    C = Matrix{Float64}(undef, N, size(B, 2))
    # - init of every device ressources
    sm_k = CuArray{Int}(undef, N * M)
    sm_v = CuArray{Float64}(undef, N * M)

    rowPtr_d = CuArray{Int}(undef, size(A_CRC[1], 1))
    colInd_d = CuArray{Int}(undef, size(A_CRC[2], 1))
    val_d = CuArray{Float64}(undef, size(A_CRC[3], 1))

    B_d = CuArray{Float64}(undef, (N, M))
    C_d1 = CuArray{Float64}(undef, (N, M))

    # - copying data to the device
    copyto!(rowPtr_d, A_CRC[1])
    copyto!(colInd_d, A_CRC[2])
    copyto!(val_d, A_CRC[3])
    copyto!(B_d, B)

    # - Run the test
    @cuda threads = N blocks = M SpMM(rowPtr_d, colInd_d, val_d, B_d, C_d1, sm_k, sm_v)
    copyto!(C, C_d1)

    # - evaluate the test
    _test_results_array = C - A * B .< TEST_FP_TOLLERANCE   # We must compare it this way because of floating operation errors. Could be interesting to understand why the calculus are different.
    _test_result = (_test_results_array == ones(N, M))
    if !_test_result
        println("""
[TEST-FAIL] :: Ge-SpMM's Algorithm 2 implimentation (`SpMM`) did NOT produce the right answer on GENERATED data !!
            :: \tFP Tollerance: $(TEST_FP_TOLLERANCE)
            :: \t Result Array: 
$(_test_results_array)
            :: [END]
                """)
    else 
        println("""
[TEST-PASS] :: Ge-SpMM's Algorithm 2 implimentation (`SpMM`) DID produce the right answer on GENERATED data !!
            :: [END]
            """) 
        # @test (_test_result) 
    end
end	#? function _Test_Algo2(N,M, A_CRC, B) 
# _Test_Algo2(N,N, A_CRC, B)



# << Ge-SpMM Algorithm 3.1 (`SpMM2_lin`) >> #
function SpMM2_lin(N, M, rowPtr, colInd, val, B; warp_size=32)
    C = zeros(N, size(B, 2))
    tb_dim = M
    sm_k = Array{Int,1}(undef, tb_dim)
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



# << Test Algo 3.1 (`SpMM2_lin`) on KNOWN data >> #
function _Test_Algo31_known()
    _C_4Test = SpMM2_lin(4, 4, A_4Test_rowPtr, A_4Test_colInd, A_4Test_val, B_4Test, warp_size=2)
        
    _test_results_array = ones(Bool, 4, 4)
    for i in 1:4
        for j in 1:4
            _test_results_array[i,j] = (_C_4Test[i,j] == C_4Test[i,j])
        end
    end
    _test_result = (_test_results_array == ones(4, 4))

    if !_test_result
        println("""
[TEST-FAIL] :: Ge-SpMM's Algorithm 3.1 implimentation (`SpMM2_lin`) did NOT produce the right answer on KNOWN data !!
            :: \t FP Tollerance: $(TEST_FP_TOLLERANCE)
            :: \tProduced Array: $(_C_4Test)
            :: \tExpected Array: $(C_4Test)
            :: \t  Result Array: $(_test_results_array)
            :: [END]
            """)
    else 
        println("""
[TEST-PASS] :: Ge-SpMM's Algorithm 3.1 implimentation (`SpMM2_lin`) DID produce the right answer on KNOWN data !!
            :: \tProduced Array: $(_C_4Test)
            :: \tExpected Array: $(C_4Test)
            :: [END]
                """) 
        # @test (_test_result) 
    end #? if !_test_results ... else ...
end	# ? function _Test_Algo31_known() 
# _Test_Algo31_known()


# << Test Algo 3.1 (`SpMM2_lin`) on GENERATED data >> #
function _Test_Algo31(N, M, A_CRC, B)
    _C = SpMM2_lin(N, M, A_CRC[1], A_CRC[2], A_CRC[3], B)

    _test_results_array = _C - A * B .< TEST_FP_TOLLERANCE   # We must compare it this way because of floating operation errors. Could be interesting to understand why the calculus are different.
    _test_result = (_test_results_array == ones(N, M))
    if !_test_result
        println("""
[TEST-FAIL] :: Ge-SpMM's Algorithm 3.1 implimentation (`SpMM2_lin`) did NOT produce the right answer on GENERATED data !!
            :: \tFP Tollerance: $(TEST_FP_TOLLERANCE)
            :: \t Result Array: 
$(_test_results_array)
            :: [END]
                """)
    else 
        println("""
[TEST-PASS] :: Ge-SpMM's Algorithm 3.1 implimentation (`SpMM2_lin`) DID produce the right answer on GENERATED data !!
            :: [END]
                """) 
        # @test (_test_result) 
    end #? if !_test_results ... else ...
end	# ? function _Test_Algo31_gen(N,M, A_CRC, B) 
# _Test_Algo31(N,M, A_CRC, B)


# << Ge-SpMM Algorithm 3 (`SpMM2`) >> #
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
    # sm_k = @cuStaticSharedMem(Int32, tb_dim)
    # sm_v = @cuStaticSharedMem(Float64, tb_dim)
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


# - clear out CUDA temp arrays 
# sm_k = CuArray{Int}(undef, N * M)
# sm_v = CuArray{Float64}(undef, N * M)


# << Test Algo 3 (`SpMM2`) >> #
function _Test_Algo3(N, M, A_CRC, B)
    C = Matrix{Float64}(undef, N, size(B, 2))

    # - init of every device ressources
    sm_k = CuArray{Int}(undef, N * M)
    sm_v = CuArray{Float64}(undef, N * M)
    rowPtr_d = CuArray{Int}(undef, size(A_CRC[1], 1))
    colInd_d = CuArray{Int}(undef, size(A_CRC[2], 1))
    val_d = CuArray{Float64}(undef, size(A_CRC[3], 1))

    B_d = CuArray{Float64}(undef, (N, M))
    C_d = CuArray{Float64}(undef, (N, M))

    # - copying data to the device
    copyto!(rowPtr_d, A_CRC[1])
    copyto!(colInd_d, A_CRC[2])
    copyto!(val_d, A_CRC[3])
    copyto!(B_d, B)

    # - Run the test
    @cuda threads=N÷2 blocks=M SpMM2(rowPtr_d, colInd_d, val_d, B_d, C_d, sm_k, sm_v)
    copyto!(C, C_d)

    # - evaluate the test
    _test_results_array = C - A * B .< TEST_FP_TOLLERANCE   # We must compare it this way because of floating operation errors. Could be interesting to understand why the calculus are different.
    _test_result = (_test_results_array == ones(N, M))
    if !_test_result
        println("""
[TEST-FAIL] :: Ge-SpMM's Algorithm 3 implimentation (`SpMM2`) did NOT produce the right answer on GENERATED data !!
            :: \tFP Tollerance: $(TEST_FP_TOLLERANCE)
            :: \t Result Array: 
$(_test_results_array)
            :: [END]
                """)
    else 
        println("""
[TEST-PASS] :: Ge-SpMM's Algorithm 3 implimentation (`SpMM2`) DID produce the right answer on GENERATED data !!
            :: [END]
            """) 
        # @test (_test_result) 
    end
end	#? function _Test_Algo2(N,M, A_CRC, B) 
_Test_Algo3(N,N, A_CRC, B)

