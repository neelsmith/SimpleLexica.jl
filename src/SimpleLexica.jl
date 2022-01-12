module SimpleLexica

import Base: show

using CiteEXchange
using CitableObject

using CitableBase
import CitableBase: citabletrait
import CitableBase: urntype
import CitableBase: urn
import CitableBase: label

import CitableBase: citablecollectiontrait
import CitableBase: cextrait
import CitableBase: fromcex

using Documenter, DocStringExtensions

export LexiconArticle
export Lexicon

include("lexentry.jl")
include("lexicon.jl")

end # module
