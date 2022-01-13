# Quick introduction

Load Lewis-Short *Latin Dictionary* from Christopher Blackwell's github repository:

```@example quick
using SimpleLexica
latdict = lewis_short()
```

Load LSJ *Lexicon*:
```@example quick
gkdict = lsj()
```

!!! note "Loading a library"

    Add note on configuring for reading the entire CEX file of the LSJ and Lewis-Short repositories as a library using the `CitableLibrary` package.