
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


"""Instantiate a `Lexicon` from delimited text.
$(SIGNATURES)
When `strict` is true, uses URN filtering to extract lexicon
data from CEX source.  When `strict` is false, the assumption is
that you are using one of Christopher Blackwell's CEX sources, and you
have extracted a single CEX block of lines to parse.
"""
function fromcex(trait::LexiconCex, cexsrc::AbstractString, T;
    delimiter = "|", configuration = nothing, strict = true)
    if strict
        @warn("Strict parsing not yet implemented.")
    end
    entries = []
    for ln in split(cexsrc, "\n")[2:end]
        if !isempty(ln)
            push!(entries, fromcex(ln, LexiconArticle, delimiter = delimiter))
        end
    end
    Lexicon(entries)
end

