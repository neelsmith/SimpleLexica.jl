

struct Lexicon
    entries::Vector{LexiconArticle}
end


struct CitableLexicon <: CitableCollectionTrait end
function citablecollectiontrait(::Type{Lexicon})
    CitableLexicon()
end

struct LexiconCex <: CexTrait end
function cextrait(::Type{Lexicon})
    LexiconCex()
end


function fromcex(trait::LexiconCex, cexsrc::AbstractString, T;
    delimiter = "|", configuration = nothing, strict = true)
    entries = []
    for ln in split(cexsrc, "\n")[2:end]
        if !isempty(ln)
            push!(entries, fromcex(ln, LexiconArticle, delimiter = delimiter))
        end
    end
    Lexicon(entries)
end

