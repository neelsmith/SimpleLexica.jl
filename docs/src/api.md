# API documentation


## Constructing and accessing basic structures

### The `LexiconArticle`

!!! note

    The `LexiconArticle` is a *citable object* and therefore also implements the functions for URN citation, URN comparison, and delimited-text serialization from the [`CitableBase` package](https://cite-architecture.github.io/CitableBase.jl/stable/).

```@docs
LexiconArticle
lemma
article
```

### The `Lexicon`

!!! note

    The `Lexicon` is a *citable collection* and therefore also implements the functions for URN filtering and delimited-text serialization from the [`CitableBase` package](https://cite-architecture.github.io/CitableBase.jl/stable/), in addition to iteration from Julia base and tabular behavior from `Tables.jl`.

```@docs
Lexicon
lexicon
lewis_short
lsj
urns
lemmata
articles
```

## Using a lexicon

```@docs
lookup
search
simplify
```
