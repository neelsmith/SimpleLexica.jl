# Use this from root directory of repository, e.g.,
#
#   julia --project=docs/ docs/make.jl
#
# Serve docs from repository root:
#
#   julia -e 'using LiveServer; serve(dir="docs/build")'
#
using Pkg
Pkg.activate(".")
Pkg.instantiate()


using Documenter, DocStringExtensions, CitableBase

makedocs(
    sitename = "SimpleLexica.jl",
    pages = [
        "Home" => "index.md"
    ]
    )

deploydocs(
    repo = "github.com/neelsmith/SimpleLexica.jl.git",
) 
