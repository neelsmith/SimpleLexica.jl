# SimpleLexica

!!! note "Background"

    See the section of this guide on [background and motivation for `SimpleLexica.jl`](./why/).


## TL;DR


Load Lewis and Short's *Latin Dictionary* from Christopher Blackwell's github repository into a `Lexicon`:

```@example quick
using SimpleLexica
latdict = lewis_short()
```

(The parallel function to load Liddell and Scott's *Greek Lexicon* is `lsj()`.)

Search for a string:

```@example quick
barbar = search(latdict, "barbarian")
```

Get the text of articles from a `Lexicon`.

```@example quick
articles(barbar)
```


## Contents of this guide

```@contents
Pages = [
    "article.md",
    "lexicon.md",
    "why.md",
    "api.md"
]
Depth = 3
```