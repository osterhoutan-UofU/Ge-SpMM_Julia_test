using Test

include("Ge-SpMM.jl") # include the julia code for the Ge-SpMM algorithms.
include("Ge-SpMM_testHelpers.jl") # include the julia code for the test helper functions Ge-SpMM algorithms.
include("Ge-SpMM_der.jl") # include the julia code for the test helper functions Ge-SpMM algorithms.
include("Ge-SpMM_der0.jl") # include the julia code for the test helper functions Ge-SpMM algorithms.
include("TEST_DIMS.jl") # include the test data

# @test _Test__SpMM_der0(TEST_DIMS[1], false, verbose=true)

@device_code_llvm io=open("./llvm/Spmm.ll", "w") @test _Test__SpMM(TEST_DIMS[1], false, verbose=true)
# @device_code_ptx io=open("./ptx/Spmm.ptx", "w") @test _Test__SpMM(TEST_DIMS[1], false, verbose=true)
