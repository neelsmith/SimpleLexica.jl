LEWIS_SHORT_URL = "https://raw.githubusercontent.com/Eumaeus/cex_lewis_and_short/master/ls.cex"


"""Construct Lewis-Short by downloading CEX from Christopher Blackwell's github repository.
$(SIGNATURES)
"""
function lewis_short()
    blks = blocks(SimpleLexica.LEWIS_SHORT_URL, UrlReader, "citedata")
    lexicon(blks[2].lines[2:end])
end


"""Extract a `Lexicon` from a local file with one of Christopher 
Blackwell's libraries in CEX format.
$(SIGNATURES)
"""
function lexicon(f::AbstractString; delimiter = "#")
    blks = blocks(f, FileReader, "citedata")
    lexicon(blks[2].lines[2:end])
end


"""Construct a `Lexicon` from a list of delimited-text lines.
$(SIGNATURES)
"""
function lexicon(linelist; delimiter = "#")
    entries = []
    for ln in linelist
        push!(entries, fromcex(ln, LexiconArticle, delimiter = delimiter))
    end
    Lexicon(entries)
end