module PlasmaDispersionFunctions

using SpecialFunctions: erfc, gamma, loggamma, faddeeva
using QuadGK: quadgk

export Z, Kappa, Maxwellian, MaxwellJuttner

abstract type AbstractDistribution end

struct Maxwellian <: AbstractDistribution end

"""
    Z(ζ, [f, l])

```math
Z_l(ζ)= \\int_{-\infty}^{\infty} \\frac{x^l f(x)}{x-ζ} dx
```

Calculate the genralized plasma dispersion function for an arbitrary distribution function `f` of order `l`.
"""
function Z end

include("Maxwellian.jl")
include("Kappa.jl")
include("MaxwellJuttner.jl")

Z(ζ) = Z(ζ, Maxwellian())
Z(ζ, dist::AbstractDistribution) = _z_integral(ζ, dist)
Z(ζ, l) = Z(ζ, Maxwellian(), l)

function _z_integral(ζ::Complex, dist::AbstractDistribution; kw...)
    f(x) = pdf(dist, x) / (x - ζ)
    val, _ = quadgk(f, -Inf, Inf; kw...)
    return val
end

function _z_integral(ζ, dist::AbstractDistribution; kw...)
    x0 = ζ
    δ = sqrt(eps(one(x0))) * (one(x0) + abs(x0))
    δ_floor = oftype(x0, 1.0e-8) * (one(x0) + abs(x0))
    δ = max(δ, δ_floor)

    g(x) = pdf(dist, x) / (x - x0)
    left, _ = quadgk(g, -Inf, x0 - δ; kw...)
    right, _ = quadgk(g, x0 + δ, Inf; kw...)
    return left + right + im * pi * pdf(dist, x0)
end

end
