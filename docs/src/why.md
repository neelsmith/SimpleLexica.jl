# Background and motivation for `SimpleLexica`


## The nineteenth and twentieth centuries

Lewis and Short's *Latin Dictionary* and especially Liddell and Scott's *Greek-English Lexicon* are monuments of nineteenth-century scholarship. Despite their Victorian language, they remain essential reference works today for their delineation of carefully distinguished senses of words, supported by cited quotations from ancient sources.

In the late twentieth century, both of these public-domain documents were digitized by the Perseus project. The texts were keyboarded, and the encoded visual formatting information then parsed algorithmically to create digital editions validating against the [Text Encoding Initiative](https://tei-c.org)'s schemas. This colossal achievement, yet to be adequately recognized or perhaps even broadly understood in the discipline of classical studies, is testimony to the exceptional work of both the original editors and typesetters, and the digital editors and coders.


### The TEI Dictionaries module

Some might describe the TEI [guidelines for encoding dictionaries](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DI.html#DIEN) as "rich"; anyone would agree that they are complex.  They support explicit annotation of an extraodinary variety of data, including, for example, elaborate structures for encoding etymological, morphological and orthographic information.

The original Perseus web applications used the TEI markup to link a selection of citations to other texts in the Perseus corpus, and to highlight the HTML display of dictionary entries for human readers. I am aware of no application that has made further use of the semantics of the TEI document. If, over thirty years, the XML markup has been used primarily to reconvert the semantic markup of the TEI edition to  the visual formatting of the print editions, it is probaby fair to consider these structures "write only": it is possible to compose validly structured TEI content, but not feasible to use it.  In any case, for scholars who want to work with the full richness of the TEI edition, the XML can be freely downloaded as part of the [Perseus Greek and Latin texts package](https://www.perseus.tufts.edu/hopper/opensource/download), but the XML structure of a TEI dictionary poses substantial challenges to two functions scholars frequently look for:  looking up an entry by a unique identifier, and searching the text content of articles. 

## Markdown lexica

In the early twenty-first century, Christopher Blackwell addressed both of those concerns with derivative editions formatted in markdown. Lexicon entries are organized in four simple fields:  

1. a sequence number giving its position in the lexicon
2. a URN uniquely identifying each entry
3. a lemma or header, formatted in markdown
4. the article body, formatted in markdown

These editions underlie the interactive applications from Furman University ([Lewis-Short](http://folio2.furman.edu/lewis-short/index.html), and [Liddell-Scott-Jones](http://folio2.furman.edu/lsj/)).  They are available under a Creative Commons license as simple delimited-text tables ([Lewis-Short](https://github.com/Eumaeus/cex_lewis_and_short), and [Liddell-Scott-Jones](https://github.com/Eumaeus/cite_lsj_cex)).


## `SimpleLexica.jl`

The goal of `SimpleLexica.jl` is to make these lexica or any markdown lexica following Christopher Blackwell's data model easily usable in Julia.  It includes functions for loading the lexica from URLs or local files, looking up content using URNs, and searching the text content of lemmata, article bodies or both (as documented in this user's guide). While most users will not need to go beyond the Furman University apps, Julia developers have the option to use the lexica in Pluto notebooks, offline Julia programs or scripts, or other as yet unimagine applications.