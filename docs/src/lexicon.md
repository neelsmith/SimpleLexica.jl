```@setup lex
root = pwd() |> dirname |> dirname
```

# The `Lexicon` type


The `Lexicon` type wraps a Vector of `LexiconArticles`.  You can load Liddell-Scott's *Greek Lexicon* from Christopher Blackwell's github repository with `lsj()` and Lewis and Short's *Latin Dictionary* with `lewis-short()`.  Performance will depend primarily on the throughput of your internet connection.

Both repositories are licensed under the terms of the *CC 3.0 BY-NC-SA* license.  If you have downloaded a copy of one of these files, you can load it from a local file with the `lexicon` function.  The following code block loads a copy of the LSJ lexicon in the `test/resources` directory of the `SimpleLexica.jl` github repository.


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

By default, the `SimpleLexica` package searches both the lemma and the article body for entries matching a given string.

```@example lex
beer = search(greeklex, "ζυθος")
```

You can limit the search to one or the other field by setting the `searchscope` parameter to `SimpleLexica.LEMMA` or `SimpleLexica.ARTICLE`.

```@example lex
 search(greeklex, "ζυθος", searchscope=SimpleLexica.LEMMA)
```

```@example lex
 search(greeklex, "ζυθος", searchscope=SimpleLexica.ARTICLE)
```


You can use the `articles`, `lemmata`, and `urns` functions to extract a list of those fields from a lexicon's entries.


```@example lex
articles(beer)
```



```@example lex
urns(beer)
```


### Optimizing searches

`SimpleLexica` uses a tidied up, parallel lexicon to search on, then returns the results from the initial, fully formatted lexicon.  If no parallel lexicon is provided, it creates one by stripping the text of lemmata and article bodies to alphabetic characters with all diacritics removed.  You can create a parallel lexicon for your own use stripped down in this way with the `simplify` method.


```@example lex
searchable = simplify(greeklex)
```

Since this can take a full second or even more on a consumer-level laptop for a lexicon as large as Liddle-Scott, you can reuse a searchable lexicon by providing it in an optional `simplified` parameter.  This can greatly increase the performance of searches.

```@example lex
 search(greeklex, "ζυθος", simplified = searchable)
```






