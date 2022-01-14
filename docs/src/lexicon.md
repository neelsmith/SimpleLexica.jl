```@setup lex
root = pwd() |> dirname |> dirname
```

# The `Lexicon` type


```@example lex
using SimpleLexica
f = joinpath(root, "test", "resources", "lsj_chicago.cex")
lex = lexicon(f)
```

```@example lex
map(entry -> titlecase(lemma(entry)), lex)
```