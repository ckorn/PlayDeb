#!/usr/bin/make -f

MANPAGES= performous.6

all: $(MANPAGES)

# NEED: help2man

clean:
	rm -f $(MANPAGES)

performous.6: performous
	chmod +x $<
	help2man --no-info --section=6 --include=../../docs/man/$<.h2m ./$< > $@
