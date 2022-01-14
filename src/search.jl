
"""Enumeration of types of search."""
@enum SearchType LEMMA=1 ARTICLE=2 ALL=3

"""Search lexicon for string.
$(SIGNATURES)
"""
function search(lex::Lexicon, s::AbstractString, searchtype::SearchType = ALL; 
    simplified = nothing, case_sensitive = true)
    "Search for $(searchtype)"
    searchable = isnothing(simplified) ? simplify(lex) : simplified
    if searchtype == LEMMA
        filter(entry -> contains(lemma(entry), s), lex)
    elseif searchtype == ARTICLE
        filter(entry -> contains(article(entry), s), lex)
    else
        filter(entry -> contains(lemma(entry), s) || contains(article(entry), s), lex)
    end
end




"""Simplify a string for searching.
Removes all non-alphabetic characters, and sim
$(SIGNATURES)
"""
function simplify(s::AbstractString)
    Unicode.normalize(filter(c -> isletter(c) || c == ' ',  s), stripmark = true)
end



"""Simplify a string for searching.
Removes all non-alphabetic characters, and sim
$(SIGNATURES)
"""
function simplify(lex::Lexicon)
    map(art -> LexiconArticle(art.seq, urn(art), simplify(lemma(art)), simplify(article(art))), lex)
end
