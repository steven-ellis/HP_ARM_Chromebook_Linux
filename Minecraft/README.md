# HP_ARM_Chromebook_Linux native Minecraft
The standard build of Mincraft contains libraries optimised for x86.
Without native libraries you're pretty much stuck with Mincreaft pocket edition as developed for the Raspberry PI.

## Files
 * bin/copy_lwjgl.sh
  * Originally from https://gist.github.com/Coderlane/079e3b77369a6a1d2b01


## Requirements
For the most part you can follow the instructions at the link below
 * http://rogerallen.github.io/jetson/2014/07/31/minecraft-on-jetson-tk1/

## Steps
 * Install Oracle JVM version 8 (note tested with 9)
```
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
```
 * Install required ARM Native Audio Library
```
apt-get install libopenal-dev
mkdir NATIVE
cp /usr/lib/arm-linux-gnueabihf/libopenal.so NATIVE
```
 * Build LWJGL follwoing Roger's instructions
  * Ubuntu supplied ARM build still doesn't work for Minecraft - appears to be related to missing libpthread
```
mkdir git
cd git
sudo apt-get install git ant
sudo apt-get install libxcursor-dev # X cursor management library (development files)
sudo apt-get install libxxf86vm-dev # X11 XFree86 video mode extension library (development headers)
sudo apt-get install libxrandr-dev  # X11 RandR extension library (development headers)
sudo apt-get install libxt-dev      # X11 Toolkit Intrinsics library (development headers)

git clone https://github.com/LWJGL/lwjgl.git
```

 * Run Mincraft and quit on errors
```
 ~/bin/minecraft
```
 * Overlay our libraries into the downloaded Mincraft environment, making sure we've specified the target correct version
```
 cd bin
 ./copy_lwjgl.sh ../NATIVE 2.9.4-nightly-20150209

```
 * Test Mincraft now runs correctly
```
~/bin/minecraft
```

Key differences from Roger's instructions are
 * Oracle JVM 8.x rather than Oracle Java 7.x
  * Standard OpenJDK for Arm32 doesn't have the performance for minecraft to be usable
 * Existing Native Libraries for sound `libopenal.so`
 * Modified `copy_lwjgl.sh` so we can select the destination library version easier

## Links / References
 * http://rogerallen.github.io/jetson/2014/07/31/minecraft-on-jetson-tk1/
 * http://ubuntuhandbook.org/index.php/2014/04/install-minecraft-in-ubuntu-14-04/
 * https://plus.google.com/+CadeRoux/posts/GR82TRo5PDs
 * http://gaming.stackexchange.com/questions/221032/minecraft-on-arm-linux-samsung-chromebook 
