using CUDA: threadIdx_x, threadIdx_y
#https://arxiv.org/pdf/2007.03179.pdf
using CUDA

function gpu_add2_print!(y, x)
    index = threadIdx().x    # this example only requires linear indexing, so just use `x`
    stride = blockDim().x
    @cuprintln("thread $index, block $stride")
    for i = index:stride:length(y)
        @inbounds y[i] += x[i]
    end
    return nothing
end

y_d = CuArray{Int32}(undef, 1024*1024)
x_d = CuArray{Int32}(undef, 1024*1024)

@cuda threads=1024 blocks=1024 gpu_add2_print!(y_d, x_d)
synchronize()
