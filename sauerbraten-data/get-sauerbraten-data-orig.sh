#!/bin/sh
set -e

RELEASEDATE=20130203
SVNREV=4783

svn co -r ${SVNREV} \
	svn://svn.code.sf.net/p/sauerbraten/code/ \
	sauerbraten-data-0.0.${RELEASEDATE}

# this command returns non-zero even if it succeeds
set +e
find sauerbraten-data-0.0.${RELEASEDATE} -type d -name '.svn' \
	-exec rm -rf "{}" \;
set -e
rm -rf sauerbraten-data-0.0.${RELEASEDATE}/bin
rm -rf sauerbraten-data-0.0.${RELEASEDATE}/bin64
rm -rf sauerbraten-data-0.0.${RELEASEDATE}/bin_unix
rm -rf sauerbraten-data-0.0.${RELEASEDATE}/src
rm -f sauerbraten-data-0.0.${RELEASEDATE}/sauerbraten.bat
rm -f sauerbraten-data-0.0.${RELEASEDATE}/sauerbraten_unix
rm -f sauerbraten-data-0.0.${RELEASEDATE}/server-init.cfg
rm -f sauerbraten-data-0.0.${RELEASEDATE}/server.bat

tar -cJf sauerbraten-data_0.0.${RELEASEDATE}.orig.tar.xz \
	sauerbraten-data-0.0.${RELEASEDATE}

rm -rf sauerbraten-data-0.0.${RELEASEDATE}
