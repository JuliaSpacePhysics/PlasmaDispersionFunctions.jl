using PlasmaDispersionFunction
using Documenter

DocMeta.setdocmeta!(PlasmaDispersionFunction, :DocTestSetup, :(using PlasmaDispersionFunction); recursive=true)

makedocs(;
    modules=[PlasmaDispersionFunction],
    authors="Beforerr <zzj956959688@gmail.com> and contributors",
    sitename="PlasmaDispersionFunction.jl",
    format=Documenter.HTML(;
        canonical="https://JuliaSpacePhysics.github.io/PlasmaDispersionFunction.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/JuliaSpacePhysics/PlasmaDispersionFunction.jl",
    devbranch="main",
)
