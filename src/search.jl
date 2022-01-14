
"""Simplify a string for searching.
Removes all non-alphabetic characters, and sim
$(SIGNATURES)
"""
function simplify(s::AbstractString)
    Unicode.normalize(filter(c -> isletter(c) || c == ' ',  s), stripmark = true)
end

function search(lex::Lexicon; simplified = nothing)
end