using PlasmaDispersionFunctions
using Test
using Aqua

@testset "Code quality (Aqua.jl)" begin
    Aqua.test_all(PlasmaDispersionFunctions)
end

@testset "Maxwellian Z" begin
    @test Z(0) ≈ im * sqrt(pi)
    @test Z(0 + 0im) ≈ im * sqrt(pi)
    @test Z(1 + 1im) ≈ -0.36905845 + 0.54014504im

    ζ = 10.0 + 2.0im
    @test Z(ζ) ≈ (-1 / ζ) atol = 1.0e-3

    ζ = 0.3 + 0.7im
    @test Z(ζ, 0) == Z(ζ)
    @test Z(ζ, 1) ≈ 1 + ζ * Z(ζ)
    @test Z(ζ, 2) ≈ ζ * (1 + ζ * Z(ζ))
    @test Z(ζ, 3) ≈ (1 / 2) + ζ^2 * (1 + ζ * Z(ζ))
end

@testset "Kappa Z" begin
    ζ = 1.0 + 0.5im
    zM = Z(ζ, Maxwellian())
    @test Z(ζ, Kappa(10000.0)) ≈ zM rtol = 1.0e-3
    @test Z(ζ, Kappa(10000.01)) ≈ zM rtol = 1.0e-3
end
