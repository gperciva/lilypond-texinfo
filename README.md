# lilypond-texinfo
testbed for LilyPond and Texinfo upstream development

This repo is for lilypond issue number 1000:
https://code.google.com/p/lilypond/issues/detail?id=1000

# Ultimate goal

The current lilypond documentation and website (e.g.,
http://lilypond.org/doc/v2.19/Documentation/contributor/index.html) is produced
with texi2html 1.82, which is obsolete.  That code was rewritten and included
as part of `texi2any` in texinfo 5.0.

The goal is to produce the same (or at least similar) HTML output using texinfo
6.0 (or later).

Side goals include:

* Making the system easier to maintain, either by simplifying the code, or by
  sending features or bugfixes upstream.


# Difficulty

The problem is that lilypond used a number of custom hooks for texi2html:
http://git.savannah.gnu.org/cgit/lilypond.git/tree/Documentation/lilypond-texi2html.init
Unfortunately, not all of those were added to `texi2any`.  Therefore:

* We need to discover which hooks are still valid, and do any updating
  necessary for `texi2any`.

* For hooks that are not valid, we'll need to find some workaround (quite
  likely involving the texinfo developers).

* Note that at the moment, there is no stable API for these hooks, and the
  documentation is quite brief.
  http://www.gnu.org/software/texinfo/manual/texinfo/html_node/texi2html.html
  http://lists.gnu.org/archive/html/help-texinfo/2015-07/msg00035.html

  As per that email, the best bet at the moment seems to be reading test files
  in the texinfo 6.0 source code.


# Current issue: filenames

As a first step to investigate the situation, we're trying to make `texi2any`
produce filenames in lower-case (to match the current lilypond website).  The
texinfo developers recommended against this idea, so we'll probably not include
it in the final version, but this seemed like a relatively easy problem to
start with.

See the initial question,
http://lists.gnu.org/archive/html/help-texinfo/2015-07/msg00015.html
and replies, particularly:
http://lists.gnu.org/archive/html/help-texinfo/2015-07/msg00021.html

Mitigating for potentially breaking the current lower-case filenames:
- links to "stable docs", i.e.
  lilypond.org/docs/stable/whatever.html
  will die, but that can happen anyway if/when documentation section names are
  changed.
- Apache has a checkspelling module which (at a quick glance) makes the files
  case-insensitive.  (I only did a 3-minute google skim for "apache case
  insensitive", so maybe there's a better option)



