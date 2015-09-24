## netboot.xyz

[![Build Status](https://travis-ci.org/antonym/netboot.xyz.svg?branch=master)](https://travis-ci.org/antonym/netboot.xyz) [![Doc Status](https://readthedocs.org/projects/netbootxyz/badge/?version=latest)](https://readthedocs.org/projects/netbootxyz)

### What is netboot.xyz?

netboot.xyz is a convenient place to boot into any type of operating system or utility disk without the need of having to go spend time retrieving the ISO just to run it. iPXE is used to provide a user friendly menu from within the BIOS that lets you easily choose the OS you want along with any specific types of versions or bootable flags.

You can remote attach the ISO to servers, set it up as a rescue option in Grub, or even set your home network to boot to it by default so that it's always available.

Check out the new netboot.xyz documentation hosted at ReadTheDocs:	
* [http://netbootxyz.readthedocs.org/en/latest/](http://netbootxyz.readthedocs.org/en/latest/)

Grab these bootloaders and drop them in Fusion/VirtualBox/DRAC/iLO to get started:

* ISO: [dhcp](http://boot.netboot.xyz/ipxe/netboot.xyz-dhcp.iso) | [static](http://boot.netboot.xyz/ipxe/netboot.xyz-static.iso)
* Floppy/USB: [dhcp](http://boot.netboot.xyz/ipxe/netboot.xyz-dhcp.dsk) | [static](http://boot.netboot.xyz/ipxe/netboot.xyz-dhcp.dsk)
* Linux Bootable Kernel: [dhcp](http://boot.netboot.xyz/ipxe/netboot.xyz-dhcp.lkrn) | [static](http://boot.netboot.xyz/ipxe/netboot.xyz-static.lkrn)
* SHA256 Checksums: [sha256sums](http://boot.netboot.xyz/ipxe/netboot.xyz-sha256-checksums.txt)

#### Feedback

Feel free to open up an issue on github or contact me at antony@mes.ser.li
