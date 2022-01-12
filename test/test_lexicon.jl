@testset "Test override of Base functions for Lexicon" begin
    n4 = Cite2Urn("urn:cite2:hmt:lsj.chicago_md:n4")
    lsjn4 = LexiconArticle(5, n4, "ἃ ἃ", "**ἃ ἃ** or ἇ ἇ, to express laughter, `A` **ha ha**, E. *Cyc.* 157, Pl.Com. 16 (prob. l.), etc.; ἃ ἃ δασυνθὲν γέλωτα δηλοῖ Hsch., Phot., Eust. 855.19." )
    cex7 = "8#urn:cite2:hmt:lsj.chicago_md:n7#ἀάβακτοι·#**ἀάβακτοι** ἀβλαβεῖς, Hsch.; cf. ἀάβηκτον· μέλαν, ἀβλαβές, *Et.Gud.* ( -βυκτον Cyr.)"
    lsjn7 = fromcex(cex7, LexiconArticle, delimiter = "#")
    lexicon = Lexicon([lsjn4, lsjn7])
    @test lexicon isa Lexicon
    @test string(lexicon) == "Lexicon with 2 articles."
end