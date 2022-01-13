
"""A lexicon comprising a list of simple `LexiconArticle`s.
"""
struct Lexicon
    entries::Vector{LexiconArticle}
end

"""Override `show` for `Lexicon`.
$(SIGNATURES)
"""
function show(io::IO, lexicon::Lexicon)
    print(io, "Lexicon with ", length(lexicon.entries), " articles.")
end

# Collectoin trait

"Singleton type for value of CitableCollectionTrait"
struct CitableLexicon <: CitableCollectionTrait end

"""
Set value of `CitableCollectionTrait` for `Lexicon`.
$(SIGNATURES)
"""
function citablecollectiontrait(::Type{Lexicon})
    CitableLexicon()
end


# CEX trait
"Singleton type for value of `CexTrait`"
struct LexiconCex <: CexTrait end

"""Set value of `CexTrait` for type `Lexicon`.
$(SIGNATURES)
"""
function cextrait(::Type{Lexicon})
    LexiconCex()
end

"""Format `lexicon` as delimited text.
$(SIGNATURES)
"""
function cex(lexicon::Lexicon; delimiter = "|")
end


"""Instantiate a `Lexicon` from lines of delimited text.
$(SIGNATURES)
"""
function fromcex(trait::LexiconCex, cexsrc::AbstractString, T;
    delimiter = "|", configuration = nothing, strict = true)
    entries = []
    for ln in split(cexsrc, "\n")
        if !isempty(ln)
            push!(entries, fromcex(ln, LexiconArticle, delimiter = delimiter))
        end
    end
    Lexicon(entries)
end


# URN comparison trait
"Singleton type for value of `UrnComparisonTrait`."
struct LexiconComparable <: UrnComparisonTrait end
"""Define value of `urncomparisontrait` for `Lexicon`.
$(SIGNATURES)
"""
function urncomparisontrait(::Type{Lexicon})
    LexiconComparable()
end


"""Filter `lexicon` for entries with urn matching `u` for equality.
$(SIGNATURES)
"""
function urnequals(u::Cite2Urn, lexicon::Lexicon)
    filter(item -> urnequals(item.urn, u), lexicon.entries)
end


"""Filter `lexicon` for entries with urn matching `u` for containment.
$(SIGNATURES)
"""
function urncontains(u::Cite2Urn, lexicon::Lexicon)
    filter(item -> urncontains(item.urn, u), lexicon.entries)
end


"""Filter `lexicon` for entries with urn matching `u` for similarity.
$(SIGNATURES)
"""
function urnsimilar(u::Cite2Urn, lexicon::Lexicon)
    filter(item -> urnsimilar(item.urn, u), lexicon.entries)
end
