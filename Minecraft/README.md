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
 * Install Oracle JVM
```
apt-get install oracle-java8-installer
```
 * Install required ARM Native Audio Library
```
apt-get install libopenal-dev
```
 * Build LWJGL
  * Ubuntu supplied ARM build still doesn't work for Minecraft
   - Appears to be related to missing libpthread
  * Follow Roger's instructions
 * Run Mincraft and quit on errors
```
~/bin/minecraft
```
 * Overlay our libraries into the downloaded Mincraft environment
```
./copy_lwjgl.sh ../NATIVE 2.9.4-nightly-20150209

```
  * NOTE - Update the second parameter above to match the current cached native library path
 * Test Mincraft now runs correctly
```
~/bin/minecraft
```

Key differences from Roger's instructions are
 * Oracle JVM 8.x rather than Oracle Java 7.x
  * Standard OpenJDK for Arm32 doesn't have the performance - 
 * Existing Native Libraries for sound - libopenal.so 
 * Modified `copy_lwjgl.sh` so we can select the destination library version easier

## Links / References
 * http://rogerallen.github.io/jetson/2014/07/31/minecraft-on-jetson-tk1/
 * http://ubuntuhandbook.org/index.php/2014/04/install-minecraft-in-ubuntu-14-04/
 * https://plus.google.com/+CadeRoux/posts/GR82TRo5PDs
 * http://gaming.stackexchange.com/questions/221032/minecraft-on-arm-linux-samsung-chromebook 
