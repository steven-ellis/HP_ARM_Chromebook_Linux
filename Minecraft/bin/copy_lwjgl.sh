#!/bin/bash

# This script will copy the newly compiled lwjgl.so and libopenal.so 
# from the specified directory into the correct minecraft jar file.
# It will then compute and update the correct sha1sum.
#
# First Arguement (Required): 
#    Path to the directory containing:
#    lwjgl.so and libopenal.so
# 
# Second Arguement (Optional):
#    Path to the directory containing:
#    liwjgl-platform-2.9.1-natives-linux.jar and 
#    liwjgl-platform-2.9.1-natives-linux.jar.sha 
#
# Example usage
# copy_lwjgl.sh ~/Minecraft/Natives
# or 
# copy_lwjgl.sh ~/Minecraft/Natives ~/.minecraft/libraries/org/lwjgl/lwjgl/lwjgl-platform/2.9.1

if [ -z "$1" ]; then
	echo "Error, Need at least one arguement."
	exit -1
else
	MINECRAFT_NATIVE_PATH=$1
fi

if [ -z "$2" ]; then
  MINECRAFT_LWJGL_PATH=~/.minecraft/libraries/org/lwjgl/lwjgl/lwjgl-platform/2.9.1
else
  MINECRAFT_LWJGL_PATH=$2
fi

zip -j "$MINECRAFT_LWJGL_PATH/lwjgl-platform-2.9.1-natives-linux.jar" \
  "$MINECRAFT_NATIVE_PATH/liblwjgl.so" \
  "$MINECRAFT_NATIVE_PATH/libopenal.so"

SHA1_SUM=$(sha1sum "$MINECRAFT_LWJGL_PATH/lwjgl-platform-2.9.1-natives-linux.jar" --tag | awk '{print $4}')

echo "New sha1sum: $SHA1_SUM"
echo $SHA1_SUM > "$MINECRAFT_LWJGL_PATH/lwjgl-platform-2.9.1-natives-linux.jar.sha"