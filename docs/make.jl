using PlasmaDispersionFunctions
using Documenter

DocMeta.setdocmeta!(PlasmaDispersionFunctions, :DocTestSetup, :(using PlasmaDispersionFunctions); recursive = true)

makedocs(;
    modules = [PlasmaDispersionFunctions],
    authors = "Beforerr <zzj956959688@gmail.com> and contributors",
    sitename = "PlasmaDispersionFunctions.jl",
    format = Documenter.HTML(;
        canonical = "https://JuliaSpacePhysics.github.io/PlasmaDispersionFunctions.jl",
        edit_link = "main",
        assets = String[],
    ),
    pages = [
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo = "github.com/JuliaSpacePhysics/PlasmaDispersionFunctions.jl",
    devbranch = "main",
)
