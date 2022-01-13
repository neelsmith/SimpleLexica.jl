
"""Lookup article by `Cite2Urn` using URN containemnt.  The URN
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
