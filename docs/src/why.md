# Background and motivation for `SimpleLexica`


## The nineteenth and twentieth centuries: print to digital

Lewis and Short's *Latin Dictionary* and especially Liddell and Scott's *Greek-English Lexicon* are monuments of nineteenth-century scholarship. Despite their Victorian language, they remain essential reference works today for their delineation of carefully distinguished senses of words, supported by cited quotations from ancient sources.

In the late twentieth century, both of these public-domain documents were digitized by the Perseus project. The texts were keyboarded, and the encoded visual formatting information then parsed algorithmically to create digital editions validating against the schemas of the [Text Encoding Initiative](https://tei-c.org) (TEI).  These TEI documents were quarried  for information for a separate morphological application.  Perseus' dictionary applications linked a selection of citations to other texts in the Perseus corpus, and highlighted the HTML display of dictionary entries for human readers. This colossal achievement, yet to be adequately recognized or perhaps even broadly understood in the discipline of classical studies, is testimony to the exceptional quality of work of both the original editors and typesetters, and the twentieth-century digital editors and scholars.

### The TEI Dictionaries module

Some might describe the TEI [guidelines for encoding dictionaries](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DI.html#DIEN) as "rich"; anyone would agree that they are complex.  They support elaborate structures to annotate features of a lexicon article such as etymological, morphological and orthographic information. I am aware of no other project or application that has made further use of the semantics of the TEI documents since the original work at Perseus. For over thirty years, the primary use of the open-source XML files has, ironically, been to reconvert their semantic markup to approximate the visual formatting of the print editions, and most of the TEI markup structures could be considered "write only" (valid XML can be composed, but reading the resulting documents semantically is impractical).

While the full TEI editions can be freely downloaded as part of the [Perseus Greek and Latin texts package](https://www.perseus.tufts.edu/hopper/opensource/download), scholars face substantial challenges navigating the TEI XML when they want to perform two essential functions:  looking up an entry by a unique identifier, and searching the text content of articles. 

## The twenty-first century: markdown lexica

In the early twenty-first century, Christopher Blackwell addressed these concerns with derivative editions that mark the next significant moment in the history of the lexica.  His editions organize lexicon entries in four simple fields:  

1. a sequence number giving the position of the entry in the lexicon
2. a URN uniquely identifying the entry
3. a lemma or header
4. the article body

The URN is a versioned identifier ensuring that each article is uniquely identified. The lemma and the article body are both formatted in markdown that preserves the common visual presentation of the print editions and  digital applications. The structure is easily represented in a simple delimited-text format that can be immediately used for lookup by identifier or for searching an article's contents.  These markdown editions underlie the interactive applications from Furman University ([Lewis-Short](http://folio2.furman.edu/lewis-short/index.html), and [Liddell-Scott-Jones](http://folio2.furman.edu/lsj/)). For anyone interested in working with the  source, the markdown lexica are freely available on github under the terms of a Creative Commons license ([Lewis-Short](https://github.com/Eumaeus/cex_lewis_and_short), and [Liddell-Scott-Jones](https://github.com/Eumaeus/cite_lsj_cex)).


## `SimpleLexica.jl`

The goal of `SimpleLexica.jl` is to make these lexica (or any other lexica following Christopher Blackwell's data model) easily usable in Julia.  It includes functions for loading the lexica from URLs or local files, looking up content using URNs, and searching the text content of lemmata, article bodies or both (as documented in the pages of this user's guide). While most users will not need to go beyond the Furman University webapps, Julia coders can trivially integrate the lexica in Pluto notebooks, offline Julia programs or scripts, or other as yet unimagined applications.