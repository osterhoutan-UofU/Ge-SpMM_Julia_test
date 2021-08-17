using Test

include("Ge-SpMM.jl") # include the julia code for the Ge-SpMM algorithms.
include("Ge-SpMM_testHelpers.jl") # include the julia code for the test helper functions Ge-SpMM algorithms.
include("Ge-SpMM_der.jl") # include the julia code for the test helper functions Ge-SpMM algorithms.
include("TEST_DIMS.jl") # include the test data

@test _Test__SpMM_der(TEST_DIMS[1], false, verbose=true)
