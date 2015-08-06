SHELL = /bin/sh

.SUFFIXES:
.SUFFIXES: .texi

MAKEINFO = makeinfo
OUTPUTDIR = out
MAKEINFOFLAGS = --html -o $(OUTPUTDIR) \
	--css-include=lilypond-manuals.css \
	--init-file=lilypond-custom-html.init

all:
	$(MAKEINFO) $(MAKEINFOFLAGS) contributor.texi

clean:
	rm -rf $(OUTPUTDIR)
