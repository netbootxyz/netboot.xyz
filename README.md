## netboot.xyz

[![Build Status](https://travis-ci.org/antonym/netboot.xyz.svg?branch=master)](https://travis-ci.org/antonym/netboot.xyz)

![netboot.xyz menu](http://netbootxyz.readthedocs.org/en/latest/img/netboot.xyz.gif)

### Bootloader Downloads

These iPXE disks will automatically load into [boot.netboot.xyz](https://boot.netboot.xyz):

| Type | Bootloader | Description |
|------|------------|-------------|
|ISO (Legacy)| [netboot.xyz.iso](https://boot.netboot.xyz/ipxe/netboot.xyz.iso)| Used for CD/DVD, Virtual CDs like DRAC/iLO, VMware, Virtual Box (Legacy) |
|ISO (EFI)|[netboot.xyz-efi.iso](https://boot.netboot.xyz/ipxe/netboot.xyz-efi.iso)| Same as ISO (Legacy) but used for EFI BIOS, works in Virtual Box EFI mode |
|Floppy| [netboot.xyz.dsk](https://boot.netboot.xyz/ipxe/netboot.xyz.dsk)| Used for 1.44 MB floppies, Virtual floppies like DRAC/iLO, VMware, Virtual Box|
|USB| [netboot.xyz.usb](https://boot.netboot.xyz/ipxe/netboot.xyz.usb)| Used for creation of USB Keys|
|Kernel| [netboot.xyz.lkrn](https://boot.netboot.xyz/ipxe/netboot.xyz.lkrn)| Used for booting from GRUB/EXTLINUX|
|DHCP| [netboot.xyz.kpxe](https://boot.netboot.xyz/ipxe/netboot.xyz.kpxe)| DHCP boot image file, uses built-in iPXE NIC drivers|
|DHCP-undionly| [netboot.xyz-undionly.kpxe](https://boot.netboot.xyz/ipxe/netboot.xyz-undionly.kpxe)| DHCP boot image file, use if you have NIC issues|
|EFI| [netboot.xyz.efi](https://boot.netboot.xyz/ipxe/netboot.xyz.efi)| EFI boot image file|

SHA256 checksums are generated during each build of iPXE and are located [here](https://boot.netboot.xyz/ipxe/netboot.xyz-sha256-checksums.txt).  You can also view the scripts that are embedded into the images [here](https://github.com/antonym/netboot.xyz/tree/master/ipxe/disks).

### What is netboot.xyz?

[netboot.xyz](http://www.netboot.xyz) is a convenient place to boot into any type of operating system or utility disk without the need of having to go spend time retrieving the ISO just to run it.  [iPXE](http://ipxe.org/) is used to provide a user friendly menu from within the BIOS that lets you easily choose the operating system you want along with any specific types of versions or bootable flags.

If you already have iPXE up and running on the network, you can hit netboot.xyz at anytime by typing:

    chain --autofree https://boot.netboot.xyz

You'll need to make sure to have [DOWNLOAD_PROTO_HTTPS](https://github.com/ipxe/ipxe/blob/master/src/config/general.h#L56) enabled in iPXE.

Full documentation is at ReadTheDocs:
* [http://netbootxyz.readthedocs.org/en/latest/](http://netbootxyz.readthedocs.org/en/latest/)

### What Operating Systems are available?

* [Antergos](https://antergos.com)
* [Arch Linux](https://www.archlinux.org)
* [CentOS](https://centos.org)
* [CoreOS Container Linux](https://coreos.com/)
* [Debian](https://debian.org)
* [Devuan](https://devuan.org)
* [Fedora](https://fedoraproject.org)
* [FreeBSD](https://freebsd.org)
* [FreeDOS](http://www.freedos.org)
* [Gentoo](https://gentoo.org)
* [IPFire](https://www.ipfire.org)
* [Mageia](http://www.mageia.org)
* [Manjaro Linux](https://manjaro.github.io)
* [Microsoft Windows](https://www.microsoft.com)
* [MirOS](https://www.mirbsd.org)
* [OpenBSD](http://openbsd.org)
* [OpenSUSE](http://opensuse.org)
* [RancherOS](http://rancher.com/rancher-os/)
* [Red Hat Enterprise Linux](https://www.redhat.com/)
* [Scientific Linux](http://scientificlinux.org)
* [Tiny Core Linux](http://tinycorelinux.net)
* [Ubuntu](http://www.ubuntu.com/)

#### Hypervisors

* [Citrix XenServer](http://xenserver.org)

#### Security Related

* [BlackArch Linux](https://blackarch.org)
* [Kali Linux](https://www.kali.org)
* [Parrot Security](https://www.parrotsec.org)

#### Utilities

* [AVG Rescue CD](http://www.avg.com/us-en/avg-rescue-cd)
* [Breakin](http://www.advancedclustering.com/products/software/breakin/)
* [Clonezilla](http://www.clonezilla.org/)
* [DBAN](http://www.dban.org/)
* [GParted](http://gparted.org)
* [Grml](http://grml.org)
* [Memtest](http://www.memtest.org/)
* [Partition Wizard](http://www.partitionwizard.com)
* [Pogostick - Offline Windows Password and Registry Editor](http://pogostick.net/~pnh/ntpasswd)
* [Super Grub2 Disk](http://www.supergrubdisk.org)
* [SystemRescueCD](https://www.system-rescue-cd.org)
* [Ultimate Boot CD](http://www.ultimatebootcd.com)

#### Testing New Branches

Under the **Utilities** menu on netboot.xyz, there's an option for ["Test netboot.xyz branch"](https://github.com/antonym/netboot.xyz/blob/master/src/utils.ipxe#L61).  If you've forked the code and have developed a new feature branch, you can use this option to chainload into that branch to test and validate the code.  All you need to do is specify your Github user name and the name of your branch or abbreviated hash of the commit. Also, disable the signature verification for *netboot.xyz* under **Signatures Checks**.

#### Feedback

Feel free to open up an [issue](https://github.com/antonym/netboot.xyz/issues) on Github, swing by [Freenode IRC](http://freenode.net/) in the [#netbootxyz](http://webchat.freenode.net/?channels=#netbootxyz) channel, or ping us on [Gitter](https://gitter.im/antonym/netboot.xyz?utm_source=share-link&utm_medium=link&utm_campaign=share-link).  Follow us on [Twitter](https://twitter.com/netbootxyz) or like us on [Facebook](https://www.facebook.com/netboot.xyz)!

