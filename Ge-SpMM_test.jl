using Random
using Test
using Printf
include("Ge-SpMM.jl") # include the julia code for the Ge-SpMM algorithms.
include("Ge-SpMM_testHelpers.jl") # include the julia code for the test helper functions Ge-SpMM algorithms.
 
TEST_FP_TOLLERANCE = 0.0001

include("TEST_DIMS.jl")

RAND_TEST_COUNT = 5 




# << ======================================================================= >> 
# <<                                TEST SETS                                >> 
# << ======================================================================= >> 

println("\n<< ============================== SpMM_lin =============================== >>\n")

# # << ============================== SpMM_lin =============================== >> 

# @testset verbose=true "`SpMM_lin` :: KNOWN Sizes w/ KNOWN data" begin
#     @testset "Dims: (M:$(dims.M), K:$(dims.K), N:$(dims.N)) SR: $(dims.SR)" for dims in TEST_DIMS[1:21]
#         @test (_Test__SpMM_lin(dims, false, FP_TOL=TEST_FP_TOLLERANCE))
#     end #? @testset "Dims: (M:$(dims.M), K:$(dims.K), N:$(dims.N)) SR: $(dims.SR)" for dims in TEST_DIMS
# end #? @testset "`SpMM_lin` :: KNOWN Sizes w/ KNOWN data"

# println()

# @testset verbose=true "`SpMM_lin` :: KNOWN Sizes w/ RANDOM data" begin
#     doRand=true
#     for i in 1:RAND_TEST_COUNT
#         @testset "Dims: (M:$(dims.M), K:$(dims.K), N:$(dims.N)) SR: $(dims.SR) x$i" for dims in TEST_DIMS
#             @test (_Test__SpMM_lin(dims, true, FP_TOL=TEST_FP_TOLLERANCE))
#         end #? @testset "Dims: (M:$(dims.M), K:$(dims.K), N:$(dims.N)) SR: $(dims.SR) x$i" for dims in TEST_DIMS
#     end
# end #? @testset "`SpMM_lin` :: KNOWN Sizes w/ RANDOM data"


println("\n\n<< ================================ SpMM ================================= >>")

# << ================================ SpMM ================================= >> 

@testset verbose=true "`SpMM` :: KNOWN Sizes w/ KNOWN data" begin
    @testset "Dims: (M:$(dims.M), K:$(dims.K), N:$(dims.N)) SR: $(dims.SR)" for dims in TEST_DIMS[1:18]
        @test (_Test__SpMM(dims, false, FP_TOL=TEST_FP_TOLLERANCE))
    end #? @testset "Dims: (M:$(dims.M), K:$(dims.K), N:$(dims.N)) SR: $(dims.SR)" for dims in TEST_DIMS
end #? @testset "`SpMM_lin` :: KNOWN Sizes w/ KNOWN data"

println()

@testset verbose=true "`SpMM` :: KNOWN Sizes w/ RANDOM data" begin
    for i in 1:RAND_TEST_COUNT
        @testset "Dims: (M:$(dims.M), K:$(dims.K), N:$(dims.N)) SR: $(dims.SR) x$i" for dims in TEST_DIMS[1:18]
            @test (_Test__SpMM(dims, true, FP_TOL=TEST_FP_TOLLERANCE))
        end #? @testset "Dims: (M:$(dims.M), K:$(dims.K), N:$(dims.N)) SR: $(dims.SR) x$i" for dims in TEST_DIMS
    end
end #? @testset "`SpMM_lin` :: KNOWN Sizes w/ RANDOM data"

println("\n\n<< ============================== SpMM2_lin ============================== >>")

# << ============================== SpMM2_lin ============================== >> 

# @testset verbose=true "`SpMM2_lin` :: KNOWN Sizes w/ KNOWN data" begin
#     @testset "Dims: (M:$(dims.M), K:$(dims.K), N:$(dims.N)) SR: $(dims.SR)" for dims in TEST_DIMS[1:21]
#         @test (_Test__SpMM2_lin(dims, false, FP_TOL=TEST_FP_TOLLERANCE))
#     end #? @testset "Dims: (M:$(dims.M), K:$(dims.K), N:$(dims.N)) SR: $(dims.SR)" for dims in TEST_DIMS
# end #? @testset "`SpMM_lin` :: KNOWN Sizes w/ KNOWN data"

# println()

# @testset verbose=true "`SpMM2_lin` :: KNOWN Sizes w/ RANDOM data" begin
#     for i in 1:RAND_TEST_COUNT
#         @testset "Dims: (M:$(dims.M), K:$(dims.K), N:$(dims.N)) SR: $(dims.SR) x$i" for dims in TEST_DIMS
#             @test (_Test__SpMM2_lin(dims, true, FP_TOL=TEST_FP_TOLLERANCE))
#         end #? @testset "Dims: (M:$(dims.M), K:$(dims.K), N:$(dims.N)) SR: $(dims.SR) x$i" for dims in TEST_DIMS
#     end
# end #? @testset "`SpMM_lin` :: KNOWN Sizes w/ KNOWN data"

# println("\n\n<< ================================ SpMM2 ================================ >>")


# # << ================================ SpMM2 ================================ >> 

# @testset verbose=true "`SpMM2` :: KNOWN Sizes w/ KNOWN data" begin
#     @testset "Dims: (M:$(dims.M), K:$(dims.K), N:$(dims.N)) SR: $(dims.SR)" for dims in TEST_DIMS[1:18]
#         @test (_Test__SpMM2(dims, false, FP_TOL=TEST_FP_TOLLERANCE))
#     end #? @testset "Dims: (M:$(dims.M), K:$(dims.K), N:$(dims.N)) SR: $(dims.SR)" for dims in TEST_DIMS
# end #? @testset "`SpMM_lin` :: KNOWN Sizes w/ KNOWN data"

# @testset verbose=true "`SpMM2` :: KNOWN Sizes w/ RANDOM data" begin
#     for i in 1:RAND_TEST_COUNT
#         @testset "Dims: (M:$(dims.M), K:$(dims.K), N:$(dims.N)) SR: $(dims.SR) x$i" for dims in TEST_DIMS[1:18]
#             @test (_Test__SpMM2(dims, true, FP_TOL=TEST_FP_TOLLERANCE))
#         end #? @testset "Dims: (M:$(dims.M), K:$(dims.K), N:$(dims.N)) SR: $(dims.SR) x$i" for dims in TEST_DIMS
#     end
# end #? @testset "`SpMM_lin` :: KNOWN Sizes w/ RANDOM data"

