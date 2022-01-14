
"""Lookup article by `Cite2Urn` using URN containment.  The URN
should uniquely identify an article in this lexicon.  If it does not,
the function returns `nothing`.
$(SIGNATURES)
"""
function lookup(u::Cite2Urn, lexicon::Lexicon)::Union{Nothing, LexiconArticle}
    matches = urncontains(u, lexicon)
    numhits = length(matches) 
    if numhits == 1
        matches[1]
    elseif numhits > 1
        @warn("Ambiguous URN: found $(numhits) matching entries.")
        nothing
    else
        @warn("No matches found for $(u).")
        nothing
    end
end


"""Extract lemmata from a lexicon.
$(SIGNATURES)
"""
function lemmata(lex::Lexicon)
    map(artcl -> lemma(artcl), lex)
end

"""Extract articles from a lexicon.
$(SIGNATURES)
"""
function articles(lex::Lexicon)
    map(artcl -> article(artcl), lex)
end

"""Extract articles from a lexicon.
$(SIGNATURES)
"""
function urns(lex::Lexicon)
    map(artcl -> urn(artcl), lex)
end