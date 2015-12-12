# HP_ARM_Chromebook_Linux Install Scripts
Scripts and tools for setting up Linux on a HP ARM Chromebook

## Background
This is originally based on the scripts from Clifford Wolf's Blog
 * http://www.clifford.at/blog/index.php?/archives/131-Installing-Ubuntu-on-an-Acer-Chromebook-13-Tegra-K1.html

## Recommended Implementation
Because the HP Chromebook only comes with 16GB eMMC storage I recommend using an external
MicroSD Card to run Ubuntu. In my case I'm using a 16GB Samsung Class-10 card

Due to the performance of the Chromebook, even with the accelerated video drivers, I wouldn't run Unity,
and instead have defaulted to XFCE

Also disable auto-mount of the key Chrome volumes to avoid potential data corruption
 * /etc/fstab
```
# Don't Automount the Chrome partitions
/dev/mmcblk0p1 /mnt/p1  ext4 uid=0,owner,noauto 0 0
/dev/mmcblk0p3 /mnt/p3  ext4 uid=0,owner,noauto 0 0
/dev/mmcblk0p5 /mnt/p5  ext4 uid=0,owner,noauto 0 0
/dev/mmcblk0p8 /mnt/p8  ext4 uid=0,owner,noauto 0 0
/dev/mmcblk0p12 /mnt/p12  vfat uid=0,owner,noauto 0 0
```

## Key Changes
The build that HP supplies is missing parted and partprobe which means the default script
from Clifford's site doesn't work on my Chromebook

Pre-format your MicroSD Card with a GPT partition layout on another machine or using fdisk before running 
```
chrubuntu.sh xubuntu-desktop lts mmcblk1
```
