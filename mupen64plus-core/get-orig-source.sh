#! /bin/sh
set -e

if [ -z "$DIR" ]; then
	DIR=mupen64plus-core
fi
if [ -z "$OWNER" ]; then
	OWNER=richard42
fi

# try to download source package
if [ "$1" != "snapshot" ]; then
	uscan --verbose --force-download
else
	MODULE="${OWNER}/${DIR}"
	TMP="`mktemp -t -d`"
	hg clone --noupdate "http://bitbucket.org/${MODULE}" "${TMP}"
	REV="`hg --repository "${TMP}" log -r tip --template '{latesttag}+{latesttagdistance}+{node|short}\n'`"
	LONGREV="`hg --repository "${TMP}" log -r tip --template '{node}\n'`"
	TARNAME="${DIR}_${REV}.orig.tar"
	echo "${LONGREV}"
	EXCLUDE="--exclude ${TMP}/.hgtags --exclude ${TMP}/.hg_archival.txt --exclude ${TMP}/.hgignore --exclude ${TMP}/roms"
	hg --repository "${TMP}" archive --no-decode --type tar --prefix "${DIR}-${REV}/" ${EXCLUDE} -r tip "${TARNAME}"
	gzip -n -f "${TARNAME}"
	rm -rf "${TMP}"
fi
