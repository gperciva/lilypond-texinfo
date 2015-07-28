SHELL = /bin/sh

.SUFFIXES:
.SUFFIXES: .texi

MAKEINFO = makeinfo
OUTPUTDIR = out
MAKEINFOFLAGS = --html -o $(OUTPUTDIR)

all:
	$(MAKEINFO) $(MAKEINFOFLAGS) contributor.texi

clean:
	rm -rf $(OUTPUTDIR)
