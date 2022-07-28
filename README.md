# scripture — A LaTeX style for typesetting Bible quotations

The `scripture` package provides a set of macros for typesetting quotations
from the Bible. It provides many features commonly seen in Bibles such as
dropped text for chapter numbers, superscripts for verse numbers, indented
lines for poetry sections, narrow sections and hanging paragraphs. A reference
for the quotation can optionally be added.

## Installation from TeXLive or MiKTeX

The `scripture` package is in TeXLive and MiKTeX and can be installed in the
usual way through your distribution. E.g., in TeXLive by running:

```
tlmgr install scripture
```

## Installation from CTAN

Download and unpack `scripture.zip` from CTAN at
https://ctan.org/pkg/scripture

Change to the `scripture` directory, then run:

```
tex scripture.ins
```

to generate `scripture.sty`.

Copy `scripture.sty` to `$TEXMFHOME/tex/latex/scripture/` and `scripture.pdf`
to `$TEXMFHOME/doc/latex/scripture/`.

You can find `$TEXMFHOME` by running:

```
kpsewhich -var-value=TEXMFHOME
```

## Installation from Git Source

`scripture` uses the `l3build` system.

Clone the git repository using:

```
git clone https://github.com/dcpurton/scripture.git
```

Change to the `scripture` directory, and then the style file (`scripture.sty`)
and documentation (`scripture.pdf`) can be installed by running:

```
l3build install --full
```

## Licence

```
Copyright (c) 2022 David Purton <dcpurton@marshwiggle.net>

This work may be distributed and/or modified under the conditions of
the LaTeX Project2 Public License, either version 1.3c of this license
or (at your option) any later version. The latest version of this
license is in
   http://www.latex-project.org/lppl.txt
and version 1.3c or later is part of all distributions of LaTeX
version 2005/12/01 or later.

This work is "maintained" (as per the LPPL maintenance status)
by David Purton.

This work consists of the files scripture.ins, scripture.dtx, README.md,
and the derived files scripture.sty and scripture.pdf
```
