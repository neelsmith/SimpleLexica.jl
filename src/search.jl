
"""Enumeration of types of search."""
@enum SearchType LEMMA=1 ARTICLE=2 ALL=3

"""Search lexicon for string.
$(SIGNATURES)
"""
function search(lex::Lexicon, s::AbstractString, searchtype::SearchType = ALL; 
    simplified = nothing, case_sensitive = true)
    
    searchable = isnothing(simplified) ? simplify(lex, case_sensitive = case_sensitive) : simplified.entries
    query = case_sensitive ? s : lowercase(s)
    results = if searchtype == LEMMA  
        filter(entry -> contains(lemma(entry), query), searchable) 
    elseif searchtype == ARTICLE
        filter(entry -> contains(article(entry), query), searchable)
    else
        filter(entry -> contains(lemma(entry), query) || contains(article(entry), query), searchable)
    end

    
end


"""Create new `LexiconArticle` with lemma and article in lower case.
$(SIGNATURES)
"""
function lc(lexentry::LexiconArticle)
    LexiconArticle(lexentry.seq, lexentry.urn, lowercase(lexentry.lemma), lowercase(lexentry.article))
end

"""Simplify a string for searching.
Removes all non-alphabetic characters, and sim
$(SIGNATURES)
"""
function simplify(s::AbstractString; case_sensitive = true)
    Unicode.normalize(filter(c -> isletter(c) || c == ' ',  s), stripmark = true)
end

"""Simplify a string for searching.
Removes all non-alphabetic characters, and sim
$(SIGNATURES)
"""
function simplify(lex::Lexicon; case_sensitive = true)
    case_sensitive ? map(art -> LexiconArticle(art.seq, urn(art), simplify(lemma(art)), simplify(article(art))), lex) :
    map(art -> LexiconArticle(art.seq, urn(art), simplify(lemma(art)), simplify(article(art))), lex) .|> lc
end
