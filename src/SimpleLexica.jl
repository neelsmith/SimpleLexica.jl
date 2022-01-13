module SimpleLexica

import Base: show
import Base: ==

import Base: iterate
import Base: length
import Base: eltype

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

using Tables, TableOperations
import TableOperations: map
import TableOperations: filter



using Documenter, DocStringExtensions

export LexiconArticle
export lemma, article

export Lexicon
export lexicon
export lsj
export lewis_short
export lookup
export lemmata

include("lexentry.jl")
include("lexicon.jl")
include("shorthands.jl")
include("lookup_search.jl")


end # module
