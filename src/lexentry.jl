
"A simple lexicon article."
struct LexiconArticle <: Citable
    seq::Int64
    urn::Cite2Urn
    lemma::AbstractString
    article::AbstractString
end

"""Singleton type for value of `CitableTrait`.
$(SIGNATURES)
"""
struct LexiconArticleCitable <: CitableTrait end
"""Set value of `CitableTrait` for `LexiconArticle`.
$(SIGNATURES)
"""
function citabletrait(::Type{LexiconArticle})
    LexiconArticleCitable()
end


"""Singleton type for value of `CexTrait`.
$(SIGNATURES)
"""
struct LexiconArticleCex <: CexTrait end
"""Set value of `CexTrait` for `LexiconArticle`.
$(SIGNATURES)
"""
function cextrait(::Type{LexiconArticle})
    LexiconArticleCex()
end


# Hard-coded for field sequence in gh repo!

"""Create LexiconArticle from cex.
$(SIGNATURES)
"""
function fromcex(traitvalue::LexiconArticleCex, cexsrc::AbstractString, T;
    delimiter = "|", configuration = nothing, strict = true)
    fields = split(cexsrc, delimiter)
    seq = parse(Int64, fields[1])
    entryurn = Cite2Urn(fields[2])
    lemma = fields[3]
    article = fields[4]
    LexiconArticle(seq, entryurn, lemma, article)
end
