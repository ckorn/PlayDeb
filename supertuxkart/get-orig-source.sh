#!/bin/sh

set -e

VERSION=$1

TEMPDIR=$(mktemp -d)

uscan --force-download --upstream-version $VERSION --no-symlink --destdir $TEMPDIR
wget http://alioth.debian.org/~christoph-guest/stk-0.6.1a-dfsg.tar.bz2 -O $TEMPDIR/replacment.tar.bz2
(cd $TEMPDIR
	tar -xjf replacment.tar.bz2
	tar -xjf  supertuxkart-${VERSION}.tar.bz2
	mv supertuxkart-${VERSION} supertuxkart-${VERSION}.orig
	cp -r stk*/* supertuxkart-${VERSION}.orig/
	GZIP="--best" tar -czf supertuxkart_${VERSION}+dfsg1.orig.tar.gz supertuxkart-${VERSION}.orig )
mv $TEMPDIR/supertuxkart_${VERSION+dfsg1.orig.tar.gz .

rm -rf $TEMPDIR
