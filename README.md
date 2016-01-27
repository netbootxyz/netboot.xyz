## netboot.xyz

[![Build Status](https://travis-ci.org/antonym/netboot.xyz.svg?branch=master)](https://travis-ci.org/antonym/netboot.xyz) [![Doc Status](https://readthedocs.org/projects/netbootxyz/badge/?version=latest)](https://readthedocs.org/projects/netbootxyz)

![netboot.xyz menu](http://netbootxyz.readthedocs.org/en/latest/img/netboot.xyz.gif)

### Bootloader Downloads

These iPXE disks will automatically load into [boot.netboot.xyz](https://boot.netboot.xyz):

| Type | DHCP Bootloaders | Static Bootloaders | Description |
|------|------------------|--------------------|-------------|
|ISO| [netboot.xyz-dhcp.iso](https://boot.netboot.xyz/ipxe/netboot.xyz-dhcp.iso)| [netboot.xyz-static.iso](https://boot.netboot.xyz/ipxe/netboot.xyz-static.iso) | Used for CD/DVD, Virtual CDs like DRAC/iLO, VMware, Virtual Box|
|USB| [netboot.xyz-dhcp.usb](https://boot.netboot.xyz/ipxe/netboot.xyz-dhcp.usb) | [netboot.xyz-static.usb](https://boot.netboot.xyz/ipxe/netboot.xyz-static.usb) | Used for creation of USB Keys|
|Kernel| [netboot.xyz-dhcp.lkrn](https://boot.netboot.xyz/ipxe/netboot.xyz-dhcp.lkrn) | [netboot.xyz-static.lkrn](https://boot.netboot.xyz/ipxe/netboot.xyz-static.lkrn) | Used for booting from GRUB/EXTLINUX|
|DHCP| [netboot.xyz-dhcp.kpxe](https://boot.netboot.xyz/ipxe/netboot.xyz-dhcp.kpxe) | [netboot.xyz-static.kpxe](https://boot.netboot.xyz/ipxe/netboot.xyz-static.kpxe) | DHCP boot image file, uses built-in iPXE NIC drivers|
|DHCP-undionly|[netboot.xyz-dhcp-undionly.kpxe](https://boot.netboot.xyz/ipxe/netboot.xyz-dhcp-undionly.kpxe) | [netboot.xyz-static-undionly.kpxe](https://boot.netboot.xyz/ipxe/netboot.xyz-static-undionly.kpxe) | DHCP boot image file, use if you have NIC issues|

The DHCP bootloaders will automatically get a network address if you have DHCP on your network while the static bootloaders will prompt you for network information.

SHA256 checksums are generated during each build of iPXE and are located [here](https://boot.netboot.xyz/ipxe/netboot.xyz-sha256-checksums.txt).  You can also view the scripts that are embedded into the images [here](https://github.com/antonym/netboot.xyz/tree/master/ipxe/disks).

### What is netboot.xyz?

[netboot.xyz](http://www.netboot.xyz) is a convenient place to boot into any type of operating system or utility disk without the need of having to go spend time retrieving the ISO just to run it.  [iPXE](http://ipxe.org/) is used to provide a user friendly menu from within the BIOS that lets you easily choose the OS you want along with any specific types of versions or bootable flags.

If you already have iPXE up and running on the network, you can hit netboot.xyz at anytime by typing:

    chain --autofree https://boot.netboot.xyz

You'll need to make sure to have [DOWNLOAD_PROTO_HTTPS](https://github.com/ipxe/ipxe/blob/master/src/config/general.h#L56) enabled in iPXE.

Full documentation is at ReadTheDocs:
* [http://netbootxyz.readthedocs.org/en/latest/](http://netbootxyz.readthedocs.org/en/latest/)

### What Operating Systems are available?

* [Antergos](https://antergos.com)
* [Arch Linux](https://www.archlinux.org)
* [CentOS](https://centos.org)
* [CoreOS](https://coreos.com/)
* [Debian](https://debian.org)
* [Fedora](https://fedoraproject.org)
* [FreeBSD](https://freebsd.org)
* [Kali Linux](https://www.kali.org)
* [Mageia](http://www.mageia.org)
* [OpenBSD](http://openbsd.org)
* [OpenSUSE](http://opensuse.org)
* [RancherOS](http://rancher.com/rancher-os/)
* [Scientific](http://scientificlinux.org)
* [TinyCoreLinux](http://distro.ibiblio.org/tinycorelinux/)
* [Ubuntu](http://www.ubuntu.com/)

#### Hypervisors

* [Citrix XenServer](http://xenserver.org)

#### Utilities

* [AVG Rescue CD](http://www.avg.com/us-en/avg-rescue-cd)
* [Clonezilla](http://www.clonezilla.org/)
* [DBAN](http://www.dban.org/)
* [GParted](http://gparted.org)
* [HDT](http://www.hdt-project.org/)
* [Memtest](http://www.memtest.org/)
* [Partition Wizard](http://www.partitionwizard.com)
* [Pogostick - Offline Windows Password and Registry Editor](http://pogostick.net/~pnh/ntpasswd)
* [Super Grub2 Disk](http://www.supergrubdisk.org)

#### Feedback

Feel free to open up an [issue](https://github.com/antonym/netboot.xyz/issues) on github or follow us on [twitter](https://twitter.com/netbootxyz).  We're also on [Freenode IRC](http://freenode.net/) in [#netbootxyz](http://webchat.freenode.net/?channels=#netbootxyz). 

#### Testing New Branches

Under the Utilities menu on netboot.xyz, there's an option for "Test netboot.xyz branch".  If you've forked the code and have developed a new feature branch, you can use this option to chainload into that branch to test and validate the code.  All you need to do is specify your github user name and the name of your branch or abbreviated hash of the commit.
