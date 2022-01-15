
LSJ_URL = "https://raw.githubusercontent.com/Descot21/Lycian/master/lexicon/hc.cex"

struct LexiconArticleWithTranscription <: AbstractLexiconArticle
    seq::Int64
    urn::Cite2Urn
    lemma::AbstractString
    xlit::AbstractString
    article::AbstractString
end



"""Override `show` for `LexiconArticleWithTranscription`.
$(SIGNATURES)
"""
function show(io::IO, lexarticle::LexiconArticleWithTranscription)
    print(io, "<", lexarticle.urn, "> ", lexarticle.lemma, " (", lexarticle.xlit, ")")
end

"""Override `==` for `LexiconArticleWithTranscription`.
$(SIGNATURES)
"""
function ==(lex1::LexiconArticleWithTranscription, lex2::LexiconArticleWithTranscription)
   lex1.xlit == lex2.xlit && lex1.seq == lex2.seq && lex1.urn == lex2.urn && lex1.lemma == lex2.lemma && lex1.article == lex2.article
end

# Access to fields
"""Lemma or heading for a `LexiconArticle`.
$(SIGNATURES)
"""
function lemma(lexart::LexiconArticleWithTranscription)
    lexart.lemma * "(" * lexart.xlit * ")"
end


"""Body of article for a `LexiconArticleWithTranscription`.
$(SIGNATURES)
"""
function article(lexart::LexiconArticleWithTranscription)
    lexart.article
end



# CitableTrait:
"""Singleton type for value of `CitableTrait`.
$(SIGNATURES)
"""
struct LexiconArticleXlitCitable <: CitableTrait end
"""Set value of `CitableTrait` for `LexiconArticleWithTranscription`.
$(SIGNATURES)
"""
function citabletrait(::Type{LexiconArticleWithTranscription})
    LexiconArticleXlitCitable()
end

"""Define URN type of LexiconArticleWithTranscription.
$(SIGNATURES)
"""
function urntype(article::LexiconArticleWithTranscription)
    Cite2Urn
end

""""URN value for `article`.
$(SIGNATURES)
"""
function urn(article::LexiconArticleWithTranscription)
    article.urn
end

"""Label for `article`.
$(SIGNATURES)
"""
function label(article::LexiconArticleWithTranscription)
    string(article)
end


###
"""Singleton type for value of `UrnComparisonTrait`.
$(SIGNATURES)
"""
struct LexArticleXlitComparable <: UrnComparisonTrait end
"""Set value of `UrnComparisonTrait` for `LexiconArticleWithTranscription`.
$(SIGNATURES)
"""
function urncomparisontrait(::Type{LexiconArticleWithTranscription})
    LexArticleXlitComparable()
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
