var documenterSearchIndex = {"docs":
[{"location":"api/#API-documentation","page":"API documentation","title":"API documentation","text":"","category":"section"},{"location":"api/#Constructing-and-accessing-basic-structures","page":"API documentation","title":"Constructing and accessing basic structures","text":"","category":"section"},{"location":"api/#The-LexiconArticle","page":"API documentation","title":"The LexiconArticle","text":"","category":"section"},{"location":"api/","page":"API documentation","title":"API documentation","text":"tip: A citable object\nThe LexiconArticle is a citable object and therefore also implements the functions for URN citation, URN comparison, and delimited-text serialization from the CitableBase package.","category":"page"},{"location":"api/","page":"API documentation","title":"API documentation","text":"LexiconArticle\nlemma\narticle","category":"page"},{"location":"api/#SimpleLexica.LexiconArticle","page":"API documentation","title":"SimpleLexica.LexiconArticle","text":"A simple lexicon article.\n\n\n\n\n\n","category":"type"},{"location":"api/#SimpleLexica.lemma","page":"API documentation","title":"SimpleLexica.lemma","text":"Lemma or heading for a LexiconArticle.\n\nlemma(lexart)\n\n\n\n\n\n\n","category":"function"},{"location":"api/#SimpleLexica.article","page":"API documentation","title":"SimpleLexica.article","text":"Body of article for a LexiconArticle.\n\narticle(lexart)\n\n\n\n\n\n\n","category":"function"},{"location":"api/#The-Lexicon","page":"API documentation","title":"The Lexicon","text":"","category":"section"},{"location":"api/","page":"API documentation","title":"API documentation","text":"tip: A citable collection\nThe Lexicon is a citable collection and therefore also implements the functions for URN filtering and delimited-text serialization from the CitableBase package, in addition to iteration from Julia base and tabular behavior from Tables.jl.","category":"page"},{"location":"api/","page":"API documentation","title":"API documentation","text":"Lexicon\nlexicon\nlewis_short\nlsj\nurns\nlemmata\narticles","category":"page"},{"location":"api/#SimpleLexica.Lexicon","page":"API documentation","title":"SimpleLexica.Lexicon","text":"A lexicon comprising a list of simple LexiconArticles.\n\n\n\n\n\n","category":"type"},{"location":"api/#SimpleLexica.lexicon","page":"API documentation","title":"SimpleLexica.lexicon","text":"Extract a Lexicon from a local file with one of Christopher  Blackwell's libraries in CEX format.\n\nlexicon(f; delimiter)\n\n\n\n\n\n\nConstruct a Lexicon from a list of delimited-text lines.\n\nlexicon(linelist; delimiter)\n\n\n\n\n\n\n","category":"function"},{"location":"api/#SimpleLexica.lewis_short","page":"API documentation","title":"SimpleLexica.lewis_short","text":"Construct Lewis-Short by downloading CEX from Christopher Blackwell's github repository.\n\nlewis_short()\n\n\n\n\n\n\n","category":"function"},{"location":"api/#SimpleLexica.lsj","page":"API documentation","title":"SimpleLexica.lsj","text":"Construct LSJ lexicon by downloading CEX from Christopher Blackwell's github repository.\n\nlsj()\n\n\n\n\n\n\n","category":"function"},{"location":"api/#SimpleLexica.urns","page":"API documentation","title":"SimpleLexica.urns","text":"Extract URNs from a lexicon.\n\nurns(lex)\n\n\n\n\n\n\n","category":"function"},{"location":"api/#SimpleLexica.lemmata","page":"API documentation","title":"SimpleLexica.lemmata","text":"Extract lemmata from a lexicon.\n\nlemmata(lex)\n\n\n\n\n\n\n","category":"function"},{"location":"api/#SimpleLexica.articles","page":"API documentation","title":"SimpleLexica.articles","text":"Extract articles from a lexicon.\n\narticles(lex)\n\n\n\n\n\n\n","category":"function"},{"location":"api/#Using-a-lexicon","page":"API documentation","title":"Using a lexicon","text":"","category":"section"},{"location":"api/","page":"API documentation","title":"API documentation","text":"lookup\nsearch\nsimplify","category":"page"},{"location":"api/#SimpleLexica.lookup","page":"API documentation","title":"SimpleLexica.lookup","text":"Lookup article by Cite2Urn using URN containment.  The URN should uniquely identify an article in this lexicon.  If it does not, the function returns nothing.\n\nlookup(u, lexicon)\n\n\n\n\n\n\n","category":"function"},{"location":"api/#SimpleLexica.search","page":"API documentation","title":"SimpleLexica.search","text":"Search lexicon lex for string s.\n\nsearch(lex, s; searchscope, simplified, case_sensitive)\n\n\nOptional parameters:\n\nsearchscope: one of SearchScope.LEMMA, SearchScope.ARTICLE, or SearchScope.ALL.  Default: SearchScope.ALL.\nsimplified: a Lexicon formatted for searching.  Default: nothing.\ncase_sensitive: true if case should be taken into account in matching.  Default: true.\n\n\n\n\n\n","category":"function"},{"location":"api/#SimpleLexica.simplify","page":"API documentation","title":"SimpleLexica.simplify","text":"Simplify a string for searching. Removes all non-alphabetic characters, and strips diacritics. If case_sensitive is false, makes all text lower case.\n\nsimplify(s; case_sensitive)\n\n\n\n\n\n\nSimplify the lemmata and article bodies of lexicon entries for searching. Removes all non-alphabetic characters, and strips diacritics. If case_sensitive is false, makes all text lower case.\n\nsimplify(lex; case_sensitive)\n\n\n\n\n\n\n","category":"function"},{"location":"article/#The-LexiconArticle-type","page":"The Lexicon Article","title":"The LexiconArticle type","text":"","category":"section"},{"location":"article/","page":"The Lexicon Article","title":"The Lexicon Article","text":"The LexiconArticle is a simple structure with lemma and article body in markdown, a Cite2Urn identifying the article, and a sequence number giving its position in the lexicon.","category":"page"},{"location":"article/","page":"The Lexicon Article","title":"The Lexicon Article","text":"using SimpleLexica\nusing CitableObject, CitableBase\nseqnum = 6560\nheading = \"canthus1\"\nbody = \"\"\"canthus, i, m., = κάνθος; lit. `I` *the iron ring around a carriage-wheel*, *the tire*, Quint. 1, 5, 88, where it is considered as barbarian (African or Spanish).—Hence, `I.B` Meton. (pars pro toto), *a wheel*, Pers. 5, 71.\"\"\"\nurn6559 = Cite2Urn(\"urn:cite2:hmt:ls.markdown:n6559\")\n\nlsn6559 = LexiconArticle(seqnum, urn6559, heading, body)","category":"page"},{"location":"article/","page":"The Lexicon Article","title":"The Lexicon Article","text":"Extract fields of an article with the functions urn, lemma or article.","category":"page"},{"location":"article/","page":"The Lexicon Article","title":"The Lexicon Article","text":"urn(lsn6559)","category":"page"},{"location":"article/","page":"The Lexicon Article","title":"The Lexicon Article","text":"lemma(lsn6559)","category":"page"},{"location":"article/","page":"The Lexicon Article","title":"The Lexicon Article","text":"article(lsn6559)","category":"page"},{"location":"lexicon/","page":"The Lexicon","title":"The Lexicon","text":"root = pwd() |> dirname |> dirname","category":"page"},{"location":"lexicon/#The-Lexicon-type","page":"The Lexicon","title":"The Lexicon type","text":"","category":"section"},{"location":"lexicon/","page":"The Lexicon","title":"The Lexicon","text":"The Lexicon type wraps a Vector of LexiconArticles.  You can load Liddell-Scott's Greek Lexicon from Christopher Blackwell's github repository with lsj() and Lewis and Short's Latin Dictionary with lewis-short().  Performance will depend primarily on the throughput of your internet connection.","category":"page"},{"location":"lexicon/","page":"The Lexicon","title":"The Lexicon","text":"Both repositories are licensed under the terms of the CC 3.0 BY-NC-SA license.  If you have downloaded a copy of one of these files, you can load it from a local file with the lexicon function.  The following code block loads a copy of the LSJ lexicon in the test/resources directory of the SimpleLexica.jl github repository.","category":"page"},{"location":"lexicon/","page":"The Lexicon","title":"The Lexicon","text":"using SimpleLexica\nf = joinpath(root, \"test\", \"resources\", \"lsj_chicago.cex\")\ngreeklex = lexicon(f)","category":"page"},{"location":"lexicon/","page":"The Lexicon","title":"The Lexicon","text":"The Lexicon type is an iterable table, so you can directly apply functions like map to it.","category":"page"},{"location":"lexicon/","page":"The Lexicon","title":"The Lexicon","text":"map(entry -> titlecase(lemma(entry)), greeklex)","category":"page"},{"location":"lexicon/#Looking-up-articles","page":"The Lexicon","title":"Looking up articles","text":"","category":"section"},{"location":"lexicon/","page":"The Lexicon","title":"The Lexicon","text":"The lookup function returns a single LexiconArticle or nothing. It uses URN containment to find an article in the lexicon, so you can refer to articles with version-independent URNs.","category":"page"},{"location":"lexicon/","page":"The Lexicon","title":"The Lexicon","text":"using CitableObject\nbeer_urn = Cite2Urn(\"urn:cite2:hmt:lsj:n46358\")\nlookup(beer_urn, greeklex)","category":"page"},{"location":"lexicon/#Searching","page":"The Lexicon","title":"Searching","text":"","category":"section"},{"location":"lexicon/","page":"The Lexicon","title":"The Lexicon","text":"By default, the SimpleLexica package searches both the lemma and the article body for entries matching a given string.","category":"page"},{"location":"lexicon/","page":"The Lexicon","title":"The Lexicon","text":"beer = search(greeklex, \"ζυθος\")","category":"page"},{"location":"lexicon/","page":"The Lexicon","title":"The Lexicon","text":"You can limit the search to one or the other field by setting the searchscope parameter to SimpleLexica.LEMMA or SimpleLexica.ARTICLE.","category":"page"},{"location":"lexicon/","page":"The Lexicon","title":"The Lexicon","text":" search(greeklex, \"ζυθος\", searchscope=SimpleLexica.LEMMA)","category":"page"},{"location":"lexicon/","page":"The Lexicon","title":"The Lexicon","text":" search(greeklex, \"ζυθος\", searchscope=SimpleLexica.ARTICLE)","category":"page"},{"location":"lexicon/","page":"The Lexicon","title":"The Lexicon","text":"You can use the articles, lemmata, and urns functions to extract a list of those fields from a lexicon's entries.","category":"page"},{"location":"lexicon/","page":"The Lexicon","title":"The Lexicon","text":"articles(beer)","category":"page"},{"location":"lexicon/","page":"The Lexicon","title":"The Lexicon","text":"lemmata(beer)","category":"page"},{"location":"lexicon/","page":"The Lexicon","title":"The Lexicon","text":"urns(beer)","category":"page"},{"location":"lexicon/#Optimizing-searches","page":"The Lexicon","title":"Optimizing searches","text":"","category":"section"},{"location":"lexicon/","page":"The Lexicon","title":"The Lexicon","text":"SimpleLexica uses a tidied up, parallel lexicon to search on, then returns the results from the initial, fully formatted lexicon.  If no parallel lexicon is provided, it creates one by stripping the text of lemmata and article bodies to alphabetic characters with all diacritics removed.  You can create a parallel lexicon for your own use stripped down in this way with the simplify method.","category":"page"},{"location":"lexicon/","page":"The Lexicon","title":"The Lexicon","text":"searchable = simplify(greeklex)","category":"page"},{"location":"lexicon/","page":"The Lexicon","title":"The Lexicon","text":"Since this can take a full second or even more on a consumer-level laptop for a lexicon as large as Liddle-Scott, you can reuse a searchable lexicon by providing it in an optional simplified parameter.  This can greatly increase the performance of searches.","category":"page"},{"location":"lexicon/","page":"The Lexicon","title":"The Lexicon","text":" search(greeklex, \"ζυθος\", simplified = searchable)","category":"page"},{"location":"#SimpleLexica","page":"Home","title":"SimpleLexica","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"note: Background\nSee the section of this guide on background and motivation for SimpleLexica.jl.","category":"page"},{"location":"#TL;DR","page":"Home","title":"TL;DR","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Load Lewis and Short's Latin Dictionary from Christopher Blackwell's github repository into a Lexicon:","category":"page"},{"location":"","page":"Home","title":"Home","text":"using SimpleLexica\nlatdict = lewis_short()","category":"page"},{"location":"","page":"Home","title":"Home","text":"(The parallel function to load Liddell and Scott's Greek Lexicon is lsj().)","category":"page"},{"location":"","page":"Home","title":"Home","text":"Search for a string:","category":"page"},{"location":"","page":"Home","title":"Home","text":"barbar = search(latdict, \"barbarian\")","category":"page"},{"location":"","page":"Home","title":"Home","text":"Get the text of articles from a Lexicon.","category":"page"},{"location":"","page":"Home","title":"Home","text":"articles(barbar)","category":"page"},{"location":"#Contents-of-this-guide","page":"Home","title":"Contents of this guide","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Pages = [\n    \"article.md\",\n    \"lexicon.md\",\n    \"why.md\",\n    \"api.md\"\n]\nDepth = 3","category":"page"},{"location":"tldr/#Quick-introduction","page":"Quick introduction","title":"Quick introduction","text":"","category":"section"},{"location":"tldr/","page":"Quick introduction","title":"Quick introduction","text":"Load Lewis-Short Latin Dictionary from Christopher Blackwell's github repository:","category":"page"},{"location":"tldr/","page":"Quick introduction","title":"Quick introduction","text":"using SimpleLexica\nlatdict = lewis_short()","category":"page"},{"location":"tldr/","page":"Quick introduction","title":"Quick introduction","text":"Load LSJ Lexicon:","category":"page"},{"location":"tldr/","page":"Quick introduction","title":"Quick introduction","text":"gkdict = lsj()","category":"page"},{"location":"tldr/","page":"Quick introduction","title":"Quick introduction","text":"note: Loading a library\nAdd note on configuring for reading the entire CEX file of the LSJ and Lewis-Short repositories as a library using the CitableLibrary package.","category":"page"},{"location":"why/#Background-and-motivation-for-SimpleLexica","page":"Background and Motivation","title":"Background and motivation for SimpleLexica","text":"","category":"section"},{"location":"why/#The-nineteenth-and-twentieth-centuries:-print-to-digital","page":"Background and Motivation","title":"The nineteenth and twentieth centuries: print to digital","text":"","category":"section"},{"location":"why/","page":"Background and Motivation","title":"Background and Motivation","text":"Lewis and Short's Latin Dictionary and especially Liddell and Scott's Greek-English Lexicon are monuments of nineteenth-century scholarship. Despite their Victorian language, they remain essential reference works today for their delineation of carefully distinguished senses of words, supported by cited quotations from ancient sources.","category":"page"},{"location":"why/","page":"Background and Motivation","title":"Background and Motivation","text":"In the late twentieth century, both of these public-domain documents were digitized by the Perseus project. The texts were keyboarded, and the encoded visual formatting information then parsed algorithmically to create digital editions validating against the schemas of the Text Encoding Initiative (TEI).  These TEI documents were quarried  for information for a separate morphological application.  Perseus' dictionary applications linked a selection of citations to other texts in the Perseus corpus, and highlighted the HTML display of dictionary entries for human readers. This colossal achievement, yet to be adequately recognized or perhaps even broadly understood in the discipline of classical studies, is testimony to the exceptional quality of work of both the original editors and typesetters, and the twentieth-century digital editors and scholars.","category":"page"},{"location":"why/#The-TEI-Dictionaries-module","page":"Background and Motivation","title":"The TEI Dictionaries module","text":"","category":"section"},{"location":"why/","page":"Background and Motivation","title":"Background and Motivation","text":"Some might describe the TEI guidelines for encoding dictionaries as \"rich\"; anyone would agree that they are complex.  They support elaborate structures to annotate features of a lexicon article such as etymological, morphological and orthographic information. I am aware of no other project or application that has made further use of the semantics of the TEI documents since the original work at Perseus. For over thirty years, the primary use of the open-source XML files has, ironically, been to reconvert their semantic markup to approximate the visual formatting of the print editions, and most of the TEI markup structures could be considered \"write only\" (valid XML can be composed, but reading the resulting documents semantically is impractical).","category":"page"},{"location":"why/","page":"Background and Motivation","title":"Background and Motivation","text":"While the full TEI editions can be freely downloaded as part of the Perseus Greek and Latin texts package, scholars face substantial challenges navigating the TEI XML when they want to perform two essential functions:  looking up an entry by a unique identifier, and searching the text content of articles. ","category":"page"},{"location":"why/#The-twenty-first-century:-markdown-lexica","page":"Background and Motivation","title":"The twenty-first century: markdown lexica","text":"","category":"section"},{"location":"why/","page":"Background and Motivation","title":"Background and Motivation","text":"In the early twenty-first century, Christopher Blackwell addressed these concerns with derivative editions that mark the next significant moment in the history of the lexica.  His editions organize lexicon entries in four simple fields:  ","category":"page"},{"location":"why/","page":"Background and Motivation","title":"Background and Motivation","text":"a sequence number giving the position of the entry in the lexicon\na URN uniquely identifying the entry\na lemma or header\nthe article body","category":"page"},{"location":"why/","page":"Background and Motivation","title":"Background and Motivation","text":"The URN is a versioned identifier ensuring that each article is uniquely identified. The lemma and the article body are both formatted in markdown that preserves the common visual presentation of the print editions and  digital applications. The structure is easily represented in a simple delimited-text format that can be immediately used for lookup by identifier or for searching an article's contents.  These markdown editions underlie the interactive applications from Furman University (Lewis-Short, and Liddell-Scott-Jones). For anyone interested in working with the  source, the markdown lexica are freely available on github under the terms of a Creative Commons license (Lewis-Short, and Liddell-Scott-Jones).","category":"page"},{"location":"why/#SimpleLexica.jl","page":"Background and Motivation","title":"SimpleLexica.jl","text":"","category":"section"},{"location":"why/","page":"Background and Motivation","title":"Background and Motivation","text":"The goal of SimpleLexica.jl is to make these lexica (or any other lexica following Christopher Blackwell's data model) easily usable in Julia.  It includes functions for loading the lexica from URLs or local files, looking up content using URNs, and searching the text content of lemmata, article bodies or both (as documented in the pages of this user's guide). While most users will not need to go beyond the Furman University webapps, Julia coders can trivially integrate the lexica in Pluto notebooks, offline Julia programs or scripts, or other as yet unimagined applications.","category":"page"}]
}