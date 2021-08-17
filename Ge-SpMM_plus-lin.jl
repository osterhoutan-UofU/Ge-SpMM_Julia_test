using CUDA: threadIdx_x, threadIdx_y
# https://arxiv.org/pdf/2007.03179.pdf
using CUDA
using Random # to generate our sparse Matrix
using Test

N = 16
sparse_ratio = 0.01

A = Matrix{Float64}(undef, N, N)
B = randexp(N, N)
C = Matrix{Float64}(undef, N, N)

for i in 1:N # we randomly fill matrice A.
    for j in 1:N
        if rand(1:N * N) <= N * N * sparse_ratio
            A[i,j] = rand(Float64)
        else
            A[i,j] = 0
        end
    end
end

function to_CRC(A) # This gave the CRC representation from a matrice A ie. the 3 vectors rowPtr, colInd and values
    rowPtr = []
    colInd = []
    val = []    
    for i = 1:size(A, 1)
        append!(rowPtr, (size(val, 1) + 1))
        for j = 1:size(A, 2)
            if A[i,j] != 0
                append!(colInd, j)
                append!(val, A[i,j])
            end
        end
    end
    append!(rowPtr, (size(val, 1) + 1))
    return rowPtr, colInd, val
end

function cuSpMM(rowPtr, colInd, val, B, C, sm_k, sm_v) # This correspond to algo2 of the paper
    warp_size = warpsize() 
    tid = threadIdx().x
    # cuPrintln("Thread idx: $(tid)")
    tb_id = blockIdx().x
    tb_dim = blockDim().x
    i = tb_id
    j = tid
    lane_id = (tid - 1) % warp_size 
    sm_base = tid - lane_id
    row_start = rowPtr[i]
    row_end = rowPtr[i + 1]
    result = 0
    for ptr in row_start:warp_size:row_end    
        if ptr + lane_id < row_end            
            sm_k[tid + (tb_id - 1) * tb_dim] = colInd[ptr + lane_id]
            sm_v[tid + (tb_id - 1) * tb_dim] = val[ptr + lane_id]
        end
        CUDA.sync_warp()
        for kk in 0:warp_size - 1
            if ptr + kk < row_end
                k = sm_k[sm_base + kk + (tb_id - 1) * tb_dim]
                result += sm_v[sm_base + kk + (tb_id - 1) * tb_dim] * B[k,j]
            end
        end
    end
    C[i,j] = result
    return nothing
end

function linSpMM(threads, blocks, rowPtr, colInd, val, B, C, sm_k, sm_v) # This correspond to algo2 of the paper
    warp_size = warpsize() 
    for tb_id in 1:blocks
        i = tb_id
        for tid in 1:threads
            j = tid
            lane_id = (tid - 1) % warp_size 
            sm_base = tid - lane_id
            row_start = rowPtr[i]
            row_end = rowPtr[i + 1]
            result = 0
            for ptr in row_start:warp_size:row_end    
                if ptr + lane_id < row_end            
                    sm_k[tid + (tb_id - 1) * tb_dim] = colInd[ptr + lane_id]
                    sm_v[tid + (tb_id - 1) * tb_dim] = val[ptr + lane_id]
                end
                # CUDA.sync_warp()
                for kk in 0:warp_size - 1
                    if ptr + kk < row_end
                        k = sm_k[sm_base + kk + (tb_id - 1) * tb_dim]
                        result += sm_v[sm_base + kk + (tb_id - 1) * tb_dim] * B[k,j]
                    end
                end
            end
            C[i,j] = result
        end
    end
    return nothing
end


function cuSpMM2(rowPtr, colInd, val, B, C, sm_k, sm_v) # This intends to implement algo3 of the paper
    warp_size = warpsize() # 32 is C Cuda Warp_size (seems to be the same here)
    tid = threadIdx().x + 1
    # @cuprintln("Thread idx: ($(tid[1]), $(tid[2]), $(tid[3]))")
    tb_id = blockIdx().x + 1
    tb_dim = blockDim().x + 1
    i = tb_id
    j = tid
    lane_id = (tid - 1) % warp_size 
    sm_base = tid - lane_id
    row_start = rowPtr[i]
    row_end = rowPtr[i + 1]
    result_1 = 0
    result_2 = 0
    for ptr = row_start:warp_size:row_end     
        if ptr + lane_id < row_end            
            sm_k[tid] = colInd[ptr + lane_id]
            sm_v[tid] = val[ptr + lane_id]
        end
        CUDA.sync_warp()
        for kk in 0:(warp_size - 1)
            k = sm_k[sm_base + kk]
            result_1 += sm_v[sm_base + kk] * B[k,j]
            result_2 += sm_v[sm_base + kk] * B[k,j + warp_size]
        end
    end
    C[i,j] = result_1
    C[i,j + warp_size] = result_2
    return nothing
end

function linSpMM2(threads, blocks, rowPtr, colInd, val, B, C, sm_k, sm_v) # This intends to implement algo3 of the paper in a linear fasion
    warp_size = CUDA.warpsize() # 32 is C Cuda Warp_size (seems to be the same here)
    for tb_id in 1:blocks
        i = tb_id
        for tid in 1:threads
            j = tid
            lane_id = (tid - 1) % warp_size 
            sm_base = tid - lane_id
            row_start = rowPtr[i]
            row_end = rowPtr[i + 1]
            result_1 = 0
            result_2 = 0
            for ptr = row_start:warp_size:row_end     
                if ptr + lane_id < row_end            
                    sm_k[tid] = colInd[ptr + lane_id]
                    sm_v[tid] = val[ptr + lane_id]
                end
                # CUDA.sync_warp()
                for kk in 0:(warp_size - 1)
                    k = sm_k[sm_base + kk]
                    result_1 += sm_v[sm_base + kk] * B[k,j]
                    result_2 += sm_v[sm_base + kk] * B[k,j + warp_size]
                end
            end
            C[i,j] = result_1
            C[i,j + warp_size] = result_2
        end
    end
    return nothing
end

function cuThreadTest()
    @cuprintf("ThreadIdx: (%d, %d, %d)", threadIdx_x(), threadIdx_y(), threadIdx_z())
end # function cuThreadTest


A_CRC = to_CRC(A)

# init of every device ressources

sm_k_d = CuArray{Int32}(undef, N * N)
sm_v_d = CuArray{Float64}(undef, N * N)

sm_k_h = Array{Int32}(undef, N * N)
sm_v_h = Array{Float64}(undef, N * N)

rowPtr_d = CuArray{Int32}(undef, size(A_CRC[1], 1))
colInd_d = CuArray{Int32}(undef, size(A_CRC[2], 1))
val_d = CuArray{Float64}(undef, size(A_CRC[3], 1))

rowPtr_h = Array{Int32}(undef, size(A_CRC[1], 1))
colInd_h = Array{Int32}(undef, size(A_CRC[2], 1))
val_h = Array{Float64}(undef, size(A_CRC[3], 1))

B_d = CuArray{Float64}(undef, (N, N))
C_d1 = CuArray{Float64}(undef, (N, N))
C_d2 = CuArray{Float64}(undef, (N, N))

B_h = Array{Float64}(undef, (N, N))
C_h1 = Array{Float64}(undef, (N, N))
C_h2 = Array{Float64}(undef, (N, N))

# copying data to the device

copyto!(rowPtr_d, A_CRC[1])
copyto!(colInd_d, A_CRC[2])
copyto!(val_d, A_CRC[3])
copyto!(B_d, B)

copyto!(rowPtr_h, A_CRC[1])
copyto!(colInd_h, A_CRC[2])
copyto!(val_h, A_CRC[3])
copyto!(B_h, B)

@cuda threads = N blocks = N cuSpMM(rowPtr_d, colInd_d, val_d, B_d, C_d1, sm_k_d, sm_v_d)
synchronize()
# copying data back from the device

copyto!(C, C_d1)
println("spmm:\n$(C)")

@test ((C - A * B .< 0.0001) == ones(N, N)) # We must compare it this way because of floating operation errors. Could be interesting to understand why the calculus are different.

linSpMM(N, N, rowPtr_h, colInd_h, val_h, B_h, C_h1, sm_k_h, sm_v_h)
@test (C == C_h1)

# linSpMM2(N, N, rowPtr_h, colInd_h, val_h, B_h, C_h2, sm_k_h, sm_v_h)
# @test (C == C_h2)

# @cuda threads=N blocks=N cuSpMM2(rowPtr_d, colInd_d, val_d, B_d, C_d2, sm_k_d, sm_v_d) #This is not working yet
# synchronize()

# @test (C_d1 == C_d2)
