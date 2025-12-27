```@meta
CurrentModule = PlasmaDispersionFunctions
```

# PlasmaDispersionFunctions

## Quickstart

```@repl quickstart
using PlasmaDispersionFunctions
Z(0)

Z(1.0 + 1.0im)

Z(1.0 + 1.0im, Kappa(5))
```

```@autodocs
Modules = [PlasmaDispersionFunctions]
```

## Benchmarks

```@repl quickstart
using Chairmarks

ζ = 1.0 + 1.0im
@b Z($ζ, 3)
@b Z($ζ, Kappa(5))
@b Z($ζ, Kappa(5.00001))
```