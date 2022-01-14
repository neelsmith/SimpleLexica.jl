# SimpleLexica

> **Background**: see [section on motivation and background](./why).


## TL;DR


Load Lewis-Short *Latin Dictionary* from Christopher Blackwell's github repository into a `Lexicon`:

```@example quick
using SimpleLexica
#latdict = lewis_short()
```

(The parallel function to load Liddell and Scott's *Greek Lexicon* is `lsj`.)

Search for a string:

```@example quick
#barbar = search(latdict, "barbarian")
```

Get text of articles from a `Lexicon`.

```@example quick
#articles(barbar)
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