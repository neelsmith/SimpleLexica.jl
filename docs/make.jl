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


using Documenter, DocStringExtensions, SimpleLexica

makedocs(
    sitename = "SimpleLexica.jl",
    pages = [
        "Home" => "index.md",
        "User's guide"=> Any[
            "The Lexicon Article" => "article.md",
            "The Lexicon" => "lexicon.md",
            "Motivation and background" => "why.md"
        ],
        "API documentation" => "api.md"
    ]
    )

deploydocs(
    repo = "github.com/neelsmith/SimpleLexica.jl.git",
) 
