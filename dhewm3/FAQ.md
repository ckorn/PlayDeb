### Which game data files are required?

Data files for the original _Doom 3_, including the MD5 hash:
<pre>
MD5 (base/pak000.pk4) = 71b8d37b2444d3d86a36fd61783844fe
MD5 (base/pak001.pk4) = 4bc4f3ba04ec2b4f4837be40e840a3c1
MD5 (base/pak002.pk4) = fa84069e9642ad9aa4b49624150cc345
MD5 (base/pak003.pk4) = f22d8464997924e4913e467e7d62d5fe
MD5 (base/pak004.pk4) = 38561a3c73f93f2e6fd31abf1d4e9102
MD5 (base/pak005.pk4) = 2afd4ece27d36393b7538d55a345b90d
MD5 (base/pak006.pk4) = a6e7003fa9dcc75073dc02b56399b370
MD5 (base/pak007.pk4) = 6319f086f930ec1618ab09b4c20c268c
MD5 (base/pak008.pk4) = 28750b7841de9453eb335bad6841a2a5
</pre>

And if you own the expansion pack _Resurrection of Evil_:
<pre>
MD5 (d3xp/pak000.pk4) = a883fef0fd10aadeb73d34c462ff865d
MD5 (d3xp/pak001.pk4) = 06fc9be965e345587064056bf22236d2
</pre>

Note that you have to patch your game to version v1.3.1 to obtain all files.

### Where do I need to put the game data files?

Each mod keeps its data files in its own sub directory relative to the so called `BASEPATH`. For the original game the sub directory is named `base` and the expansion is named `d3xp`.

_dhewm 3_ tries to find the `BASEDIR` in the following order:

For _Windows_:
* Next to the binary `dhewm3.exe`
* The original _Doom 3_ installation directory (if you have installed the game from CD)
* The steam _Doom 3_ installation directory

For _*nix_:
* The data directory which was configured at compile time (`$CMAKE_INSTALL_PREFIX/share/dhewm3`; the default is `/usr/local/share/dhewm3`)
* The default _Doom 3_ installation directory `/usr/local/games/doom3` (if you have installed the game from CD)

For _OSX_:
* The directory the bundle is in

Data files can also be placed in the savegame folder (see below). These will always take precedence over the paths listed above on all platforms.

### Where do I find the config files and savegames?

For _Windows_:
* `My Games\dhewm3` in your localized `My Documents`

For _*nix_:
* config files: `$XDG_CONFIG_HOME/dhewm3` (default: `$HOME/.config/dhewm3`)
* savegames: `$XDG_DATA_HOME/dhewm3` (default: `$HOME/.local/share/dhewm3`)

For _OSX_:
* `Library/Application Support/dhewm3` in your home directory

### The console key does not open the console. How to fix?
This is a side effect of the move to SDL.
Start the game once with the command line parameter: `+set in_kbd german`

Current supported layouts are: `english` `french` `german` `italian` `spanish` `turkish`

If your layout is not supported, file a bug. You need to mention the symbol codes of the console key for your keyboard layout. These can be taken from [this codepage](http://en.wikipedia.org/wiki/ISO/IEC_8859-1#Codepage_layout). We need the codes (the bold ones) for the symbol you get when pressing that key, once without and once with shift.

### How do I enable the OpenAL EFX sound effects?
Just enable `EAX 4.0 HD` in the system options.