@doc raw"""
    Z(ζ, Maxwellian())

```math
Z(ζ) = \frac{1}{\sqrt{π}} \int \frac{e^{-x^2}}{x-ζ}\,dx,\qquad \Im(ζ)>0
```

Implemented via the Faddeeva function:

```math
Z(ζ) = i\sqrt{π}\,w(ζ),\qquad w(z)=e^{-z^2}\,\operatorname{erfc}(-iz).
```
"""
function Z(ζ, ::Maxwellian)
    z = complex(ζ)
    return im * sqrt(pi) * faddeeva(z)
end

function _I_l(l::Integer)
    return isodd(l) ? 0 : gamma(l / 2 + 1 / 2) / sqrt(pi)
end

@doc raw"""
    Z(ζ, Maxwellian(), l)

```math
Z_l(ζ) \equiv \frac{1}{\sqrt{\pi}} \int \frac{ x^l e^{-x^2} }{x-ζ} \,dx,
```

satisfy the recurrence relation

```math
Z_l(ζ) = ζ Z_{l-1}(ζ) + I_l
```

where ``I_l = \int x^l e^{-x^2}\,dx / \sqrt{\pi}`` is the `l`-th moment of the Maxwellian distribution.
"""
function Z(ζ, ::Maxwellian, l)
    @assert l >= 0 "l must be nonnegative"
    zl = Z(ζ, Maxwellian())
    for n in 1:l
        zl = _I_l(n - 1) + ζ * zl
    end
    return zl
end
