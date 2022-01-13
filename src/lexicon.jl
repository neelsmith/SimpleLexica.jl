
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


"Singleton type for value of CitableCollectionTrait"
struct CitableLexicon <: CitableCollectionTrait end

"""
Set value of `CitableCollectionTrait` for `Lexicon`.
$(SIGNATURES)
"""
function citablecollectiontrait(::Type{Lexicon})
    CitableLexicon()
end

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

