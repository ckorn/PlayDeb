#!/bin/sh

if [ ! -d debian ] ; then
	echo "run from root source directory."
	exit 1
fi

rm -f debian/redeclipse-data.links debian/redeclipse-data.install
for d in $(find . -maxdepth 1 -type d ! -name debian ! -name .) ; do
    bd=$(basename $d)
    echo "usr/share/games/redeclipse/$bd		usr/lib/games/redeclipse/$bd" >> debian/redeclipse-data.links
    echo "$bd		usr/share/games/redeclipse" >> debian/redeclipse-data.install
done

