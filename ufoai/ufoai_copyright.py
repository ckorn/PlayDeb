#!/usr/bin/python
# -*- coding: utf-8 -*-
from collections import defaultdict

FNAME = "LICENSES"
COPYRIGHT_FILE = "copyright"

GPL2 = "GNU General Public License 2.0"
GPL2PLUS = "GNU General Public License 2.0 or later"
GPL3PLUS = "GNU General Public License 3.0 or later"
PUBLIC_DOMAIN = "Public Domain"
EXPAT = "MIT/X11 license (GPL compatible)"
CCBYSA3 = "Creative Commons Attribution-Share Alike 3.0"
CCBY3 = "Creative Commons Attribution 3.0 Unported"
licenses = (GPL2, GPL2PLUS, GPL3PLUS, PUBLIC_DOMAIN, EXPAT, CCBYSA3, CCBY3)
d1 = {}
d2 = {}


def header():
    head = ("Format: http://www.debian.org/doc/packaging-manuals/"
                "copyright-format/1.0/\n"
                "Upstream-Name: UFO Alien Invasion\n"
                "Source: http://sourceforge.net/projects/ufoai/\n"
                "Comment:\n"
                " Please refer to the ufoai_copyright.py script for how a raw\n"
                " version of this copyright file is generated. All data was\n"
                " split into three separate source packages, ufoai-data,\n"
                " ufoai-maps and ufoai-music, due to practical (size) and\n"
                " functional reasons.\n"
                "\n\n")
    return head


def paragraph(dict1, dict2):
    '''Print a copyright format 1.0 license paragraph
    dict1 - dictionary with license as key and files as values
    dict2 - dictionary with license as key and authors as unique values
    '''
    for license, v in dict1.items():
        print("Files:", file=cfile)
        for line in v:
            print(" {}".format(line.rstrip()), file=cfile)
        print("Copyright:", file=cfile)
        v = dict2[license]
        for line in v:
            print("{}".format(line.rstrip()), file=cfile)
        print("License: {}\n".format(license), file=cfile)


with open(FNAME, encoding="utf-8") as f:
    d1 = defaultdict(list)
    d2 = defaultdict(set)
    for line in f:
        a_list = line.split("|")
        try:
            for license in licenses:
                if license in a_list[1]:
                    if license == GPL2 and GPL2PLUS in a_list[1]:
                        continue
                    else:
                        d1[license].append(a_list[0])
                        d2[license].add(a_list[2])
        except (KeyError, IndexError):
            pass


with open(COPYRIGHT_FILE, mode="w", encoding="utf-8") as cfile:
    cfile.write(header())
    paragraph(d1, d2)
