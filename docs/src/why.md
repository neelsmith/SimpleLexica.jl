# Background and motivation for `SimpleLexica`


## The nineteenth and twentieth centuries

Lewis and Short's *Latin Dictionary* and especially Liddell and Scott's *Greek-English Lexicon* are monuments of nineteenth-century scholarship. Despite their Victorian language, they remain essential reference works today for their  delineation of the historical evolution carefully distinguished senses of words, supported by cited quotations from ancient sources.

In the late twentieth century, both of these public-domain documents were digitized by the Perseus project.  This was an equally colossal achievement that has yet to be adequately recognized or perhaps even broadly understood in the discipline of classical studies.  The texts were keyboarded, and the encoded visual formatting information then parsed algorithmically to create digital editions validating against the [Text Encoding Initiative](https://tei-c.org)'s schemas.


## The TEI Dictionaries module

Some would describe the TEI [guidelines for encoding dictionaries](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DI.html#DIEN) as "rich"; all would agree that they are complex.  They support explicit annotation of an extraodinary variety of data, including, for example, elaborate structures for encoding etymological, morphological and orthographic information.

The original Perseus applications using the lexica used the TEI markup to link a selection of cross references to other texts in the Perseus corpus, and to highlight the HTML display of dictionary entries for human readers. I am aware of no applications making further use of the semantics of the TEI semantics in the past thirty years, so it is probaby fair to consider these structures "write only":  it is possible to compose validly structured TEI content, but not feasibly to use it.  In any case, for scholars who want to work with the TEI edition, the full TEI XML can be freely downloaded as part of the [Perseus Greek and Latin texts package](https://www.perseus.tufts.edu/hopper/opensource/download).



## Markdown lexica

The XML structure of a TEI dictionary poses significant challenges for two of the most frequent functions scholars could look for:  finding an entry by a unique identifier, and searching the text content of articles.  In the early twenty-first century, Christopher Blackwell addressed both of those concerns with derivative editions formatted in markdown. Lexicon entries are organized in four simple fields:  

1. a sequence number giving its position in the lexicon
2. a URN uniquely identifying each entry
3. a lemma or header, formatted in markdown
4. the article body, formatted in markdown

These editions underlie the interactive applications from Furman University ([Lewis-Short](http://folio2.furman.edu/lewis-short/index.html), and [Liddell-Scott-Jones](http://folio2.furman.edu/lsj/)).  They are available under a Creative Commons license as simple delimited-text tables ([Lewis-Short](https://github.com/Eumaeus/cex_lewis_and_short), and [Liddell-Scott-Jones](https://github.com/Eumaeus/cite_lsj_cex)).


## `SimpleLexica.jl`

The goal of `SimpleLexica.jl` is to make these lexica or any markdown lexica following Christopher Blackwell's data model easily usable in Julia.  It includes functions for loading the lexica from URLs or local files, looking up content using URNs, and searching the text content of lemmata, article bodies or both (as documented in this user's guide). While most users will not need to go beyond the Furman University apps, Julia developers have the option to use the lexica in Pluto notebooks, offline Julia programs or scripts, or other as yet unimagine applications.