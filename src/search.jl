
"""Enumeration of types of search."""
@enum SearchScope LEMMA=1 ARTICLE=2 ALL=3

"""Search lexicon `lex` for string `s`.
$(SIGNATURES)
Optional parameters:

- `searchscope`: one of `SearchScope.LEMMA`, `SearchScope.ARTICLE`, or `SearchScope.ALL`.  Default: `SearchScope.ALL`.
- `simplified`: a `Lexicon` formatted for searching.  Default: `nothing`.
- `case_sensitive`: true if case should be taken into account in matching.  Default: `true`.
"""
function search(lex::Lexicon, s::AbstractString;  searchscope::SearchScope = ALL, 
    simplified = nothing, case_sensitive = true)
    searchable = isnothing(simplified) ? simplify(lex, case_sensitive = case_sensitive) : simplified
    query = case_sensitive ? s : lowercase(s)
   
    results = []
    if searchscope == LEMMA  
        for idx in findall(a -> contains(lemma(a), query), searchable.entries)
            push!(results, lex.entries[idx])
        end
    elseif searchscope == ARTICLE
        for idx in findall(a -> contains(article(a), query), searchable.entries)
            push!(results, lex.entries[idx])
        end
    else
        for idx in findall(a -> contains(article(a), query ) || contains(lemma(a), query), searchable.entries)
            push!(results, lex.entries[idx])
        end
    end
    results |> Lexicon
end


"""Create new `LexiconArticle` with lemma and article in lower case.
$(SIGNATURES)
"""
function lc(lexentry::LexiconArticle)
    LexiconArticle(lexentry.seq, lexentry.urn, lowercase(lexentry.lemma), lowercase(lexentry.article))
end

"""Simplify a string for searching.
Removes all non-alphabetic characters, and strips diacritics.
If `case_sensitive` is `false`, makes all text lower case.
$(SIGNATURES)
"""
function simplify(s::AbstractString; case_sensitive = true)
    Unicode.normalize(filter(c -> isletter(c) || c == ' ',  s), stripmark = true) 
end

"""Simplify the lemmata and article bodies of lexicon entries for searching.
Removes all non-alphabetic characters, and strips diacritics.
If `case_sensitive` is `false`, makes all text lower case.
$(SIGNATURES)
"""
function simplify(lex::Lexicon; case_sensitive = true)
    case_sensitive ? map(art -> LexiconArticle(art.seq, urn(art), simplify(lemma(art)), simplify(article(art))), lex) |> Lexicon :
    map(art -> LexiconArticle(art.seq, urn(art), simplify(lemma(art)), simplify(article(art))), lex) .|> lc |> Lexicon
end
