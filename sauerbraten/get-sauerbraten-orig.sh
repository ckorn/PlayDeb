#!/bin/sh
set -e

RELEASEDATE=20130203

svn co -r \{$((${RELEASEDATE} + 1))\} \
	svn://svn.code.sf.net/p/sauerbraten/code/src \
	sauerbraten-0.0.${RELEASEDATE}

# this command my return non-zero even if it succeeds
set +e
find sauerbraten-0.0.${RELEASEDATE} -type d -name '.svn' \
	-exec rm -rf "{}" \;
set -e
rm -rf sauerbraten-0.0.${RELEASEDATE}/lib
rm -rf sauerbraten-0.0.${RELEASEDATE}/lib64
rm -rf sauerbraten-0.0.${RELEASEDATE}/vcpp
rm -rf sauerbraten-0.0.${RELEASEDATE}/xcode
tar -cJf sauerbraten_0.0.${RELEASEDATE}.orig.tar.xz \
	sauerbraten-0.0.${RELEASEDATE}

rm -rf sauerbraten-0.0.${RELEASEDATE}
