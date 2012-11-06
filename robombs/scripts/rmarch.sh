#Remove binaries from the wron arch from pkg
#!/bin/bash
for arg; do
  case $arg in
    RDIR=*) RDIR=${arg#RDIR=};;
  esac;
done

ARCH=$(uname -m)

if [ "$ARCH" == "x86_64" ]; then
 rm -f $RDIR/debian/robombs/usr/share/games/robombs/lib/lwjgl-2.0rc2/native/linux/libjinput-linux.so
 rm -f $RDIR/debian/robombs/usr/share/games/robombs/lib/lwjgl-2.0rc2/native/linux/liblwjgl.so
else
 rm -f $RDIR/debian/robombs/usr/share/games/robombs/lib/lwjgl-2.0rc2/native/linux/libjinput-linux64.so
 rm -f $RDIR/debian/robombs/usr/share/games/robombs/lib/lwjgl-2.0rc2/native/linux/liblwjgl64.so
fi
