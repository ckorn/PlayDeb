# ABOUT

_dhewm 3_ is a _Doom 3_ GPL source modification.

The goal of _dhewm 3_ is bring _DOOM 3_ with the help of SDL to all suitable
plaforms.

Bugs present in the original _DOOM 3_ will be fixed (when identified) without
altering the original gameplay.

**The project is hosted at:** https://github.com/dhewm

**Consult the FAQ at:** https://github.com/dhewm/dhewm3/wiki/FAQ

**Report bugs here:** https://github.com/dhewm/dhewm3/issues


# CHANGES

Compared to the original _DOOM 3_, the changes of _dhewm 3_ worth mentioning are:

- 64bit port
- SDL for low level OS support, OpenGL and input handling
- OpenAL for audio output, all OS specific audio backends are gone
- OpenAL EFX for EAX reverb effects (read: EAX on all platforms)
- A portable build system based on CMake
- (Cross-)compilation with mingw-w64


# GENERAL NOTES

## Game data and patching

This source release does not contain any game data, the game data is still
covered by the original EULA and must be obeyed as usual.

You must patch the game to the latest version.

Note that _Doom 3_ and _Doom 3: Resurrection of Evil_ are available from the Steam store at

http://store.steampowered.com/app/9050/

http://store.steampowered.com/app/9070/

## Compiling

The build system is based on CMake: http://cmake.org/

Required libraries are not part of the tree. These are:

- zlib
- libjpeg (minimum v6, v8 recommended)
- libogg
- libvorbis
- libvorbisfile (may be part of libvorbis)
- OpenAL (OpenAL Soft required, Creative's and Apple's versions are made of fail)
- SDL v1.2
- libcurl (optional, required for server downloads)

For UNIX like system these libraries need to be installed (including the
developer files). It is recommended to use the software management tools of
your OS (apt-get, portage, rpm, BSD ports, MacPorts, ...).

For Windows there are two options:

- Use the provided binaries (recommended, see below)
- Compile these libraries yourself

Create a distinct build folder outside of this source repository and issue
the cmake command there, pointing it at the neo/ folder from this repository:

`cmake /path/to/repository/neo`

OSX users need to point cmake at OpenAL Soft (better solutions welcome):

`cmake -DOPENAL_LIBRARY=/usr/local/lib/libopenal.dylib -DOPENAL_INCLUDE_DIR=/usr/local/include /path/to/repository/neo`

## Using the provided Windows binaries

Get a clone of the latest binaries here: https://github.com/dhewm/dhewm3-libs

There are two subfolder:

- 32bit binaries are located in "i686-w64-mingw32"
- 64bit binaries are located in "x86_64-w64-mingw32"

Issue the appropriate command from the build folder, for example:

`cmake -G "Visual Studio 10" -DDHEWM3LIBS=/path/to/dhewm3-libs/i686-w64-mingw32 /path/to/repository/neo`

`cmake -G "MinGW Makefiles" -DDHEWM3LIBS=/path/to/dhewm3-libs/x86_64-w64-mingw32 /path/to/repository/neo`

The binaries are compatible with mingw-w64 and all MSVC versions.

## Cross compiling

For cross compiling a CMake Toolchain file is required.

For the mingw-w64 toolchain "i686-w64-mingw32" on Ubuntu precise it looks like:

<pre>
set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR i686)

set(CMAKE_C_COMPILER i686-w64-mingw32-gcc)
set(CMAKE_CXX_COMPILER i686-w64-mingw32-g++)
set(CMAKE_RC_COMPILER i686-w64-mingw32-windres)

set(CMAKE_FIND_ROOT_PATH /usr/i686-w64-mingw32)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
</pre>

Then point CMake at your Toolchain file:
`cmake -DCMAKE_TOOLCHAIN_FILE=/path/to/Toolchain.cmake -DDHEWM3LIBS=/path/to/dhewm3-libs/i686-w64-mingw32 /path/to/repository/neo`

## Back End Rendering of Stencil Shadows

The Doom 3 GPL source code release does not include functionality enabling rendering
of stencil shadows via the depth fail method, a functionality commonly known as
"Carmack's Reverse".

## MayaImport

The code for our Maya export plugin is included, if you are a Maya licensee
you can obtain the SDK from Autodesk.


# LICENSE

See copyright file