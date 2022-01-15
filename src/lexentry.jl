
"A simple lexicon article."
struct LexiconArticle <: AbstractLexiconArticle
    seq::Int64
    urn::Cite2Urn
    lemma::AbstractString
    article::AbstractString
end

# Override `Base` functions:

"""Override `show` for `LexiconArticle`.
$(SIGNATURES)
"""
function show(io::IO, lexarticle::LexiconArticle)
    print(io, "<", lexarticle.urn, "> ", lexarticle.lemma)
end

"""Override `==` for `LexiconArticle`.
$(SIGNATURES)
"""
function ==(lex1::LexiconArticle, lex2::LexiconArticle)
   lex1.seq == lex2.seq && lex1.urn == lex2.urn && lex1.lemma == lex2.lemma && lex1.article == lex2.article
end

# Access to fields
"""Lemma or heading for a `LexiconArticle`.
$(SIGNATURES)
"""
function lemma(lexart::LexiconArticle)
    lexart.lemma
end


"""Body of article for a `LexiconArticle`.
$(SIGNATURES)
"""
function article(lexart::LexiconArticle)
    lexart.article
end



# CitableTrait:
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

"""Define URN type of LexiconArticle.
$(SIGNATURES)
"""
function urntype(article::LexiconArticle)
    Cite2Urn
end

"""Define URN type of LexiconArticle.
$(SIGNATURES)
"""
function urn(article::LexiconArticle)
    article.urn
end

"""Define URN type of LexiconArticle.
$(SIGNATURES)
"""
function label(article::LexiconArticle)
    string(article)
end


###
"""Singleton type for value of `UrnComparisonTrait`.
$(SIGNATURES)
"""
struct LexArticleComparable <: UrnComparisonTrait end
"""Set value of `UrnComparisonTrait` for `LexiconArticle`.
$(SIGNATURES)
"""
function urncomparisontrait(::Type{LexiconArticle})
    LexArticleComparable()
end


"""True if `u` equals URN of `article`.
$(SIGNATURES)
"""
function urnequals(u::Cite2Urn, article::LexiconArticle)
    urnequals(u, article.urn)
end

"""True if `u` contains URN of `article`.
$(SIGNATURES)
"""
function urncontains(u::Cite2Urn, article::LexiconArticle)
    urncontains(u, article.urn)
end

"""True if `u` and URN of `article` are URN similar.
$(SIGNATURES)
"""
function urnsimilar(u::Cite2Urn, article::LexiconArticle)
    urnsimilar(u, article.urn)
end




#### CEX trait
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

"""Serialize `article` to delimited-text format.
$(SIGNATURES)
"""
function cex(article::LexiconArticle; delimiter = "|")
    join([article.seq, article.urn, article.lemma,article.article], delimiter)
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
