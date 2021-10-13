using CUDA
using Random
using Test
include("Ge-SpMM.jl") # include the julia code for the Ge-SpMM algorithms.


"""
Generate a Matrix or sparse matrix either randomly 
 or one who's values are directly determined by the provided dimensions 
 (if `doRand=false`).
"""
function genSpM(rows::Int, cols::Int; sparse_ratio::Float64=1.0, doRand::Bool=true)
    A = Matrix{Float64}(undef, (rows, cols))
    # cols = (isnothing(cols)) ? rows : cols
    if doRand # we randomly fill matrice A.
        for i in 1:rows 
            for j in 1:cols
                if rand(1:rows * cols) <= rows * cols * sparse_ratio
                    A[i,j] = rand(Float64)
                else
                    A[i,j] = 0
                end
            end
        end
    else # we build the same matrix A for the sparse_ratio and dimensions
        for i in 1:rows
            for j in 1:cols
                if sparse_ratio >= 1 || i % rows <= 2 || j % cols <= 2
                    A[i,j] = ((i - 1) * rows + (j - 1)) / (rows)
                else
                    A[i,j] = 0
                end
            end
        end
    end
    return A
end # function genSpMgenSpM(rows::Int,cols::Int, sparse_ratio::Float64=1.0, doRand::Bool=true)



# << ======================================================================= >> 
# <<                             TEST FUNCTIONS                              >> 
# << ======================================================================= >> 

function _Test__SpMM_lin(dims, doRand; FP_TOL::Float64=0.0001, verbose::Bool=false)
    M, K, N, SR = dims
    A = genSpM(dims.M, dims.K, sparse_ratio=dims.SR, doRand=doRand)
    A_CRC = to_CRC(A)
    B = genSpM(dims.K, dims.N, doRand=doRand)
    C = SpMM_lin(dims.M, dims.N, A_CRC[1], A_CRC[2], A_CRC[3], B)
    _test_results_array = (-FP_TOL .< (C - (A * B)) .< FP_TOL)   # We must compare it this way because of floating operation errors. Could be interesting to understand why the calculus are different.
    _test_result = all(_test_results_array)
    if !verbose
        return _test_result
    end
    if _test_result
        println("""
[TEST-PASS] :: Ge-SpMM's Algorithm 1 implimentation (`SpMM_lin`) DID produce the right answer on GENERATED data !!
            ::\tdims: (M: $M, K: $K, N: $N)
            :: [END]
                """)
        return true
    else 
        println("""
[TEST-FAIL] :: Ge-SpMM's Algorithm 1 implimentation (`SpMM_lin`) did not produce the right answer on GENERATED data !!
            ::\tdims: (M: $M, K: $K, N: $N)
            ::\tFP Tollerance: $(FP_TOL)
            ::\t Result Array: $(getShowString_log(_test_results_array))
            ::
            ::\t        C exp: $((A * B)[M,1:4])
            ::\t        C act: $(C[M,1:4])
            :: [END]
             """)
        return false
    end
end	# ? function _Test__SpMM_lin(dims, A_CRC, B) 



function _Test__SpMM(dims, doRand; FP_TOL::Float64=0.0001, verbose::Bool=false)
    M, K, N, SR = dims
    A = genSpM(dims.M, dims.K, sparse_ratio=dims.SR, doRand=doRand)
    A_CRC = to_CRC(A)
    B = genSpM(dims.K, dims.N, doRand=doRand)
    C = Matrix{Float64}(undef, M, N)
    # - init of every device ressources
    # sm_k = CuArray{Int32}(undef, M*N)
    # sm_v = CuArray{Float64}(undef, M*N)

    rowPtr_d = CuArray{Int32}(undef, size(A_CRC[1], 1))
    colInd_d = CuArray{Int32}(undef, size(A_CRC[2], 1))
    val_d = CuArray{Float64}(undef, size(A_CRC[3], 1))

    B_d = CuArray{Float64}(undef, (K, N))
    C_d = CuArray{Float64}(undef, (M, N))

    # - copying data to the device
    copyto!(rowPtr_d, A_CRC[1])
    copyto!(colInd_d, A_CRC[2])
    copyto!(val_d, A_CRC[3])
    copyto!(B_d, B)

    # - Run the test
    @cuda threads = N blocks = M SpMM(rowPtr_d, colInd_d, val_d, B_d, C_d#= , sm_k, sm_v =#)
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


function _Test__SpMM2_lin(dims, doRand; FP_TOL::Float64=0.0001, verbose::Bool=false)
    M, K, N, SR = dims
    A = genSpM(dims.M, dims.K, sparse_ratio=dims.SR, doRand=doRand)
    A_CRC = to_CRC(A)
    B = genSpM(dims.K, dims.N, doRand=doRand)
    C = SpMM2_lin(N, M, A_CRC[1], A_CRC[2], A_CRC[3], B)

    _test_results_array = (-FP_TOL .< (C - (A * B)) .< FP_TOL)   # We must compare it this way because of floating operation errors. Could be interesting to understand why the calculus are different.
    _test_result = all(_test_results_array)
    if !verbose
        return _test_result
    end
    if !_test_result
        println("""
[TEST-FAIL] :: Ge-SpMM's Algorithm 3.1 implimentation (`SpMM2_lin`) did NOT produce the right answer on GENERATED data !!
            ::\tdims: (M: $M, K: $K, N: $N)
            :: \tFP Tollerance: $(FP_TOL)
            :: \t Result Array: $(getShowString_log(_test_results_array))
            :: [END]
                """)
        return false
    else 
        println("""
[TEST-PASS] :: Ge-SpMM's Algorithm 3.1 implimentation (`SpMM2_lin`) DID produce the right answer on GENERATED data !!
            ::\tdims: (M: $M, K: $K, N: $N)
            :: [END]
                """) 
        return true
    end # ? if !_test_results ... else ...
end	# ? function _Test__SpMM2_lin(N,M, A_CRC, B) 




function _Test__SpMM2(dims, doRand; FP_TOL::Float64=0.0001, verbose::Bool=false)
    # M, K, N, SR = dims
    A = genSpM(dims.M, dims.K, sparse_ratio=dims.SR, doRand=doRand)
    A_CRC = to_CRC(A)
    B = genSpM(dims.K, dims.N, doRand=doRand)
    C = Matrix{Float64}(undef, dims.M, dims.N)

    # - init of every device ressources
    # sm_k = CuArray{Int}(undef, M * N)
    # sm_v = CuArray{Float64}(undef, M * N)

    rowPtr_d = CuArray{Int}(undef, size(A_CRC[1], 1))
    colInd_d = CuArray{Int}(undef, size(A_CRC[2], 1))
    val_d = CuArray{Float64}(undef, size(A_CRC[3], 1))

    B_d = CuArray{Float64}(undef, (dims.K, dims.N))
    C_d = CuArray{Float64}(undef, (dims.M, dims.N))

    # - copying data to the device
    copyto!(rowPtr_d, A_CRC[1])
    copyto!(colInd_d, A_CRC[2])
    copyto!(val_d, A_CRC[3])
    copyto!(B_d, B)

    # - Run the test
    @cuda threads = dims.N ÷ 2 blocks = dims.M SpMM2(dims.M, rowPtr_d, colInd_d, val_d, B_d, C_d#= , sm_k, sm_v =#)
    copyto!(C, C_d)

    # - evaluate the test
    _test_results_array = (-FP_TOL .< (C - (A * B)) .< FP_TOL)   # We must compare it this way because of floating operation errors. Could be interesting to understand why the calculus are different.
    _test_result = all(_test_results_array)
    if !verbose
        return _test_result
    end
    if !_test_result
        println("""
[TEST-FAIL] :: Ge-SpMM's Algorithm 3 implimentation (`SpMM2`) did NOT produce the right answer on GENERATED data !!
            ::\tdims: (M: $(dims.M), K: $(dims.K), N: $(dims.N))
            ::\tFP Tollerance: $(FP_TOL)
            ::\tResult Array: $(getShowString_log(_test_results_array))
            :: [END]
                """)
        return false
    else 
        println("""
[TEST-PASS] :: Ge-SpMM's Algorithm 3 implimentation (`SpMM2`) DID produce the right answer on GENERATED data !!
            ::\tdims: (M: $(dims.M), K: $(dims.K), N: $(dims.N))
            :: [END]
            """) 
        return true 
    end
end	# ? function _Test__SpMM2(N,M, A_CRC, B) 



"""
Return a string representation for my log format that looks like the
    REPL version of the object (`obj`).
"""
function getShowString_log(obj, height::Int=48, width::Int=48; LOG_LINE_HEADER::String="            ::\t\t")
    io = IOBuffer()
    show(IOContext(io, :limit => true, :displaysize => (height, width)), "text/plain", obj)
    s = String(take!(io))
    s = strip(s, [' ', '\n', '\r'])
    s_formatted = replace(s, r"\n" => "\n$LOG_LINE_HEADER")
    return s_formatted
end # ? function getShowString_log(obj, height::Int=32, width::Int=48)
