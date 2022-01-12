# URN#Description#Labelling property#Ordering property#License
# https://github.com/cite-architecture/CitableLibrary.jl#dev


#=
5#urn:cite2:hmt:lsj.chicago_md:n4#ἃ ἃ#**ἃ ἃ** or ἇ ἇ, to express laughter, `A` **ha ha**, E. *Cyc.* 157, Pl.Com. 16 (prob. l.), etc.; ἃ ἃ δασυνθὲν γέλωτα δηλοῖ Hsch., Phot., Eust. 855.19.
=#

using CiteEXchange
using CitableObject

using CitableBase
import CitableBase: citabletrait

import CitableBase: citablecollectiontrait
import CitableBase: cextrait
import CitableBase: fromcex

struct LSJentry <: Citable
    seq::Int64
    urn::Cite2Urn
    lemma::AbstractString
    fulltext::AbstractString
end

lsjn4 = LSJentry(5, Cite2Urn("urn:cite2:hmt:lsj.chicago_md:n4"), "ἃ ἃ", "**ἃ ἃ** or ἇ ἇ, to express laughter, `A` **ha ha**, E. *Cyc.* 157, Pl.Com. 16 (prob. l.), etc.; ἃ ἃ δασυνθὲν γέλωτα δηλοῖ Hsch., Phot., Eust. 855.19." )


struct LexEntryCitable <: CitableTrait end
function citabletrait(::Type{LSJentry})
    LexEntryCitable()
end

struct LsjEntryCex <: CexTrait end
function cextrait(::Type{LSJentry})
    LsjEntryCex()
end


# Hard-coded for field sequence in gh repo!
"Create LSJentry from cex"
function fromcex(traitvalue::LsjEntryCex, cexsrc::AbstractString, T;
    delimiter = "|", configuration = nothing, strict = true)
    fields = split(cexsrc, delimiter)
    seq = parse(Int64, fields[1])
    entryurn = Cite2Urn(fields[2])
    lemma = fields[3]
    fulltext = fields[4]
    LSJentry(seq, entryurn, lemma, fulltext)
end

 
cexs = "8#urn:cite2:hmt:lsj.chicago_md:n7#ἀάβακτοι·#**ἀάβακτοι** ἀβλαβεῖς, Hsch.; cf. ἀάβηκτον· μέλαν, ἀβλαβές, *Et.Gud.* ( -βυκτον Cyr.)"
lsjn7 = fromcex(cexs, LSJentry, delimiter = "#")



struct LSJ
    entries::Vector{LSJentry}
end


struct CitableLexicon <: CitableCollectionTrait end
function citablecollectiontrait(::Type{LSJ})
    CitableLexicon()
end

struct LSJCex <: CexTrait end
function cextrait(::Type{LSJ})
    LSJCex()
end


function fromcex(trait::LSJCex, cexsrc::AbstractString, T;
    delimiter = "|", configuration = nothing, strict = true)
    entries = []
    for ln in split(cexsrc, "\n")[2:end]
        if !isempty(ln)
            push!(entries, fromcex(ln, LSJentry, delimiter = delimiter))
        end
    end
    LSJ(entries)
end

lsjurn = Cite2Urn("urn:cite2:hmt:lsj.chicago_md:")
f = joinpath("cite_lsj_cex", "lsj_chicago.cex")

datablocks = blocks(f, FileReader, "citedata")
lsjblock = datablocks[2]
alldatacex = join(lsjblock.lines, "\n") * "\n"
lsj = fromcex(alldatacex, LSJ, delimiter = "#")

