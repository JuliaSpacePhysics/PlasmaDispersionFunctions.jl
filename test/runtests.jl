using PlasmaDispersionFunction
using Test
using Aqua

@testset "PlasmaDispersionFunction.jl" begin
    @testset "Code quality (Aqua.jl)" begin
        Aqua.test_all(PlasmaDispersionFunction)
    end
    # Write your tests here.
end
