```@setup lex
root = pwd() |> dirname |> dirname
```

# The `Lexicon` type


The `Lexicon` type wraps a Vector of `LexiconArticles`.  You can load Liddell-Scott's *Greek Lexicon* from Christopher Blackwell's github repository with `lsj()` and Lewis and Short's *Latin Dictionary* with `lewis-short()`.  Performance will depend primarily on the throughput of your internet connection.

Both repositories are licensed under the terms of the *CC 3.0 BY-NC-SA* license.  If you have downloaded a copy of one of these files, you can load it from a local file with the `lexicon` function.


```@example lex
using SimpleLexica
f = joinpath(root, "test", "resources", "lsj_chicago.cex")
greeklex = lexicon(f)
```

The `Lexicon` type is an iterable table, so you can directly apply functions like `map` to it.

```@example lex
map(entry -> titlecase(lemma(entry)), greeklex)
```


## Looking up articles

The `lookup` function returns a single `LexiconArticle` or `nothing`. It uses URN containment to find an article in the lexicon, so you can refer to articles with version-independent URNs.

```@example lex
using CitableObject
beer_urn = Cite2Urn("urn:cite2:hmt:lsj:n46358")
lookup(beer_urn, greeklex)
```



## Searching

By default, the `SimpleLexica` package searches the lemma and article body for entries matching a given string.

```@example lex
beer = search(greeklex, "ζυθος")
```

You can limit the search to one or the other by setting the `searchtype` parameter to `SimpleLexica.LEMMA` or `SimpleLexica.ARTICLE`.

```@example lex
 search(greeklex, "ζυθος", searchtype=SimpleLexica.LEMMA)
```

```@example lex
 search(greeklex, "ζυθος", searchtype=SimpleLexica.ARTICLE)
```


You can use the `articles`, `lemmata`, and `urns` functions to extract a list of those fields from a lexicon's entries.


```@example lex
articles(beer)
```



```@example lex
urns(beer)
```


### Optimizing searches

`SimpleLexica` prepares a parallel lexicon to search on, then returns the results from the initial lexicon.  If no parallel lexicon is provided, it prepares one by stripping the text of lemmata and article bodies to alphabetic characters with all diacritics removed.  You can create a parallel lexicon stripped down in this way with the `simplify` method.


```@example lex
searchable = simplify(greeklex)
```

Since this can take a second or more for a lexicon as large as Liddle-Scott on a consumer-level laptop, you can supply a stripped-down lexicon in an optional `simplified` parameter.  This can greatly increase the performance of your search.

```@example lex
 search(greeklex, "ζυθος", simplified = searchable)
```






