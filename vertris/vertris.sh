#!/bin/sh
HDIR=$HOME/.vertris
if [ ! -d $HDIR ]; 
then
  mkdir $HDIR
  ln -s /usr/share/games/vertris/sounds $HDIR/sounds
  ln -s /usr/share/games/vertris/images $HDIR/images
fi
cd $HDIR
/usr/share/games/vertris/vertris
