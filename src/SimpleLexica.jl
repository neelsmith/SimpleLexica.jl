module SimpleLexica

import Base: show
import Base: ==

using CiteEXchange
using CitableObject

using CitableBase
import CitableBase: citabletrait
import CitableBase: urntype
import CitableBase: urn
import CitableBase: label


import CitableBase: urncomparisontrait
import CitableBase: urnequals
import CitableBase: urncontains
import CitableBase: urnsimilar


import CitableBase: cextrait
import CitableBase: fromcex
import CitableBase: cex

import CitableBase: citablecollectiontrait

using Documenter, DocStringExtensions

export LexiconArticle
export Lexicon

export lexicon
export lsj
export lewis_short

include("lexentry.jl")
include("lexicon.jl")
include("lewisshort.jl")
include("lsj.jl")

end # module
