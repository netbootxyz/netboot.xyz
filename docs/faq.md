# Frequently Asked Questions

## What is this?
netboot.xyz is tool that allows you to boot your favorite Operating System's installer or various utilities over the network with minimal overhead and all from a single menu system.  It's similar to various tools netbooting tools of the past like boot.kernel.org with a lot more flexibility.  The boot loader is very light weight being under 1MB in size which translates into a very quick time to create a USB key.

## How does this work?
netboot.xyz uses an open source tool called iPXE.  The bootloader used calls to a webserver that hosts that the iPXE source files.  The iPXE source files contain menus and logic that understand how the various Linux installers operate.  When you select an Operating System, netboot.xyz retrieves the images from the project directory when possible or known and trusted performant mirrors.  The location the file is pulled from is always displayed during retrieval.

## Will my favorite distribution work?
Usually you need three things to boot up an OS, the vmlinuz, the initramfs, and the rootfs.  Distributions that support an installer kernel hosted on a mirror are typically the easier ones to implement.  Distributions that only release as ISOs typically are harder to implement as we have to use memdisk to load it up into memory.  

From [syslinux - memdisk](http://www.syslinux.org/wiki/index.php/MEMDISK): The majority of Linux based CD images will also fail to work with MEMDISK ISO emulation. Linux distributions require kernel and initrd files to be specified, as soon as these files are loaded the protected mode kernel driver(s) take control and the virtual CD will no longer be accessible. If any other files are required from the CD/DVD they will be missing, resulting in boot error(s). Linux distributions that only require kernel and initrd files function fully via ISO emulation, as no other data needs accessing from the virtual CD/DVD drive once they have been loaded. The boot loader has read all necessary files to memory by using INT 13h, before booting the kernel.

You can read more about my thoughts and possible solutions [here](https://www.reversengineered.com/2016/01/07/booting-linux-isos-with-memdisk-and-ipxe/).

## My distribution uses ISOs for delivery, how can I see if they work?
You can do a quick check by loading up netboot.xyz in a virtual environment baremetal.  Make sure you have plenty of RAM as you are loading the ISO into RAM.  Then select the iPXE command line and enter the following;

    kernel https://boot.netboot.xyz/memdisk iso raw
    initrd http://url/to/iso
    boot

That should load the ISO and if you make it all the way into the installer, great, your OS may work.  If it fails during initramfs load trying to load the CD device, then it has the issue of not being able to find the ISO in memory.

## Can I create my own configurations?

Yes!  You can fork [netboot.xyz-custom](https://github.com/antonym/netboot.xyz-custom) and create your own menu.  You can then set your Github user from the Utility menu and your menu will show up in the main menu.  If you don't want to set your user every time, you can custom compile the netboot.xyz iPXE code and include your github_user during the compile.  This allows you to create your own menu without the maintenance of everything else.

## What are some good resources for learning more about network booting?

* [The iPXE Project](http://ipxe.org/)
* [NetworkBoot.org](http://networkboot.org/)
* [Syslinux Project](http://www.syslinux.org/wiki/index.php?title=The_Syslinux_Project)
