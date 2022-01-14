# The `LexiconArticle` type


The `LexiconArticle` is a simple structure with lemma and article body in markdown, a `Cite2Urn` identifying the article, and a sequence number giving its position in the lexicon.

```@example article
using SimpleLexica
using CitableObject, CitableBase
seqnum = 6560
lemma = "canthus1"
body = """canthus, i, m., = κάνθος; lit. `I` *the iron ring around a carriage-wheel*, *the tire*, Quint. 1, 5, 88, where it is considered as barbarian (African or Spanish).—Hence, `I.B` Meton. (pars pro toto), *a wheel*, Pers. 5, 71."""
urn6559 = Cite2Urn("urn:cite2:hmt:ls.markdown:n6559")

lsn6559 = LexiconArticle(seqnum, urn6559, lemma, body)
```

Extract fields of an article with the functions `urn`, `lemma` or `article`.



```@example article
article(lsn6559)
```

```@example article
urn(lsn6559)
```

