@testset "Test extension of `Base` functions for `LexiconArticle`` type" begin
    n4 = Cite2Urn("urn:cite2:hmt:lsj.chicago_md:n4")
    lsjn4 = LexiconArticle(5, n4, "ἃ ἃ", "**ἃ ἃ** or ἇ ἇ, to express laughter, `A` **ha ha**, E. *Cyc.* 157, Pl.Com. 16 (prob. l.), etc.; ἃ ἃ δασυνθὲν γέλωτα δηλοῖ Hsch., Phot., Eust. 855.19." )
    @test lsjn4 isa LexiconArticle
    @test string(lsjn4) == "<urn:cite2:hmt:lsj.chicago_md:n4> ἃ ἃ"
    dupe = lsjn4
    @test dupe == lsjn4
end


@testset "Test citable trait for LexiconArticle" begin
    n4 = Cite2Urn("urn:cite2:hmt:lsj.chicago_md:n4")
    lsjn4 = LexiconArticle(5, n4, "ἃ ἃ", "**ἃ ἃ** or ἇ ἇ, to express laughter, `A` **ha ha**, E. *Cyc.* 157, Pl.Com. 16 (prob. l.), etc.; ἃ ἃ δασυνθὲν γέλωτα δηλοῖ Hsch., Phot., Eust. 855.19." )
    @test citabletrait(typeof(lsjn4)) == SimpleLexica.LexiconArticleCitable()
    @test citable(lsjn4)
    @test urntype(lsjn4) == Cite2Urn
    @test urn(lsjn4) == n4
    @test label(lsjn4) == "<urn:cite2:hmt:lsj.chicago_md:n4> ἃ ἃ"
end


#cexs = "8#urn:cite2:hmt:lsj.chicago_md:n7#ἀάβακτοι·#**ἀάβακτοι** ἀβλαβεῖς, Hsch.; cf. ἀάβηκτον· μέλαν, ἀβλαβές, *Et.Gud.* ( -βυκτον Cyr.)"
    #lsjn7 = fromcex(cexs, LexiconArticle, delimiter = "#")
 

# URN#Description#Labelling property#Ordering property#License
# https://github.com/cite-architecture/CitableLibrary.jl#dev


#=
5#urn:cite2:hmt:lsj.chicago_md:n4#ἃ ἃ#**ἃ ἃ** or ἇ ἇ, to express laughter, `A` **ha ha**, E. *Cyc.* 157, Pl.Com. 16 (prob. l.), etc.; ἃ ἃ δασυνθὲν γέλωτα δηλοῖ Hsch., Phot., Eust. 855.19.


lsjurn = Cite2Urn("urn:cite2:hmt:lsj.chicago_md:")
f = joinpath("cite_lsj_cex", "lsj_chicago.cex")

datablocks = blocks(f, FileReader, "citedata")
lsjblock = datablocks[2]
alldatacex = join(lsjblock.lines, "\n") * "\n"
lsj = fromcex(alldatacex, Lexicon, delimiter = "#")


=#