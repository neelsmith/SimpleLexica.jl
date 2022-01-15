module SimpleLexica
using Unicode

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

using Tables
import Tables: istable
import Tables: rows
import Tables: columns

using Documenter, DocStringExtensions

export AbstractLexiconArticle,LexiconArticle
export lemma, article

export Lexicon
export urns, lemmata, articles
export lexicon, lsj, lewis_short
export lookup


export SearchScope
export search
export simplify



include("abstract.jl")
include("lexentry.jl")
include("lexicon.jl")
include("lycian.jl")
include("constructors.jl")
include("lookup.jl")
include("search.jl")


end # module
