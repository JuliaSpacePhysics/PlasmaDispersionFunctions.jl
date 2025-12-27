struct Kappa{T} <: AbstractDistribution
    κ::T
end


@doc raw"""
    Z(ζ, Kappa(κ))

Modified kappa plasma dispersion function (Summers & Thorne), defined as

```math
Z_{κ}(ζ)=\frac{\Gamma(κ+1)}{\sqrt{\pi\,κ^3}\,\Gamma(κ-1/2)}
\int_{-\infty}^{\infty}\frac{dx}{(x-ζ)\,(1+x^2/κ)^{κ+1}},\qquad \Im(ζ)>0.
```

For any positive integer ``κ`` and all ``ζ \neq \pm i\sqrt{κ}``, a closed-form expansion is used:

```math
Z_{κ}(ζ)=\frac{i(κ-1/2)}{2κ^{3/2}}\,\frac{κ!}{(2κ)!}
\sum_{l=1}^{κ+1}\frac{(κ+l-1)!}{(l-1)!}\left(\frac{2i}{(ζ/\sqrt{κ})+i}\right)^{κ-l+2}.
```
"""
function Z(ζ, d::Kappa)
    κ = d.κ
    isinteger(κ) && imag(ζ) > 0 && return _Z_kappa_integer(ζ, Int(κ))
    iszero(imag(ζ)) && return _z_integral(real(ζ), d)
    return _z_integral(ζ, d)
end


function _Z_kappa_integer(ζ::Complex, κ::Int)
    @assert imag(ζ) > 0 "integer-κ closed-form requires Im(ζ) > 0"
    base = (2im) / (ζ / sqrt(κ) + im)
    logpref = log(κ - 0.5) - log(2) - (3 / 2) * log(κ) + loggamma(κ + 1) - loggamma(2κ + 1)
    return im * sum(1:(κ + 1)) do l
        pow = κ - l + 2
        logcoef = loggamma(κ + l) - loggamma(l)
        exp(logpref + logcoef + pow * log(base))
    end
end

function pdf(d::Kappa, x)
    κ = d.κ
    lognorm = loggamma(κ + 1) - (1 / 2) * log(pi) - (3 / 2) * log(κ) - loggamma(κ - 1 / 2)
    return exp(lognorm - (κ + 1) * log1p((x * x) / κ))
end
