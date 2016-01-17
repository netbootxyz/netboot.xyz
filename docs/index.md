## netboot.xyz 
[![Build Status](https://travis-ci.org/antonym/netboot.xyz.svg?branch=master)](https://travis-ci.org/antonym/netboot.xyz) [![Join the chat at https://gitter.im/antonym/netboot.xyz](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/antonym/netboot.xyz?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

![netboot.xyz menu](img/netboot.xyz.gif)

### Bootloader Downloads

These iPXE disks will automatically load into [boot.netboot.xyz](http://boot.netboot.xyz):

| Type | DHCP Bootloaders | Static Bootloaders | Description |
|------|------------------|--------------------|-------------| 
|ISO| [netboot.xyz-dhcp.iso](http://boot.netboot.xyz/ipxe/netboot.xyz-dhcp.iso)| [netboot.xyz-static.iso](http://boot.netboot.xyz/ipxe/netboot.xyz-static.iso) | Used for CD/DVD, Virtual CDs like DRAC/iLO, VMware, Virtual Box|
|USB| [netboot.xyz-dhcp.usb](http://boot.netboot.xyz/ipxe/netboot.xyz-dhcp.usb) | [netboot.xyz-static.usb](http://boot.netboot.xyz/ipxe/netboot.xyz-static.usb) | Used for creation of USB Keys|
|Kernel| [netboot.xyz-dhcp.lkrn](http://boot.netboot.xyz/ipxe/netboot.xyz-dhcp.lkrn) | [netboot.xyz-static.lkrn](http://boot.netboot.xyz/ipxe/netboot.xyz-static.lkrn) | Used for booting from GRUB/EXTLINUX|
|DHCP| [netboot.xyz-dhcp.kpxe](http://boot.netboot.xyz/ipxe/netboot.xyz-dhcp.kpxe) | [netboot.xyz-static.kpxe](http://boot.netboot.xyz/ipxe/netboot.xyz-static.kpxe) | DHCP boot image file, uses built-in iPXE NIC drivers|
|DHCP-undionly|[netboot.xyz-dhcp-undionly.kpxe](http://boot.netboot.xyz/ipxe/netboot.xyz-dhcp-undionly.kpxe) | [netboot.xyz-static-undionly.kpxe](http://boot.netboot.xyz/ipxe/netboot.xyz-static-undionly.kpxe) | DHCP boot image file, use if you have NIC issues|

The DHCP bootloaders will automatically get a network address if you have DHCP on your network while the static bootloaders will prompt you for network information.  

SHA256 checksums are generated during each build of iPXE and are located [here](http://boot.netboot.xyz/ipxe/netboot.xyz-sha256-checksums.txt).  You can also view the scripts that are embedded into the images [here](https://github.com/antonym/netboot.xyz/tree/master/ipxe/disks).

### What is netboot.xyz?

[netboot.xyz](http://www.netboot.xyz) is a way to select various operating system installers or utilities from one place within the BIOS without the need of having to go retrieve the media to run the tool.  [iPXE](http://ipxe.org/) is used to provide a user friendly menu from within the BIOS that lets you easily choose the OS you want along with any specific types of versions or bootable flags.

You can remote attach the ISO to servers, set it up as a rescue option in Grub, or even set up your home network to boot to it by default so that it's always available.

### Getting started

Download the bootloader of your choice from the links above and add it to your favorite virtualization tool to start testing out netboot.xyz.  These are precompiled versions of the latest version of [iPXE](http://https://github.com/ipxe/ipxe) that will chainload you to [http://boot.netboot.xyz](http://boot.netboot.xyz).  There are two versions of each, one if you have DHCP on your network, and one if you have to set a static IP before connecting outside of your network.

If you already have iPXE up and running on the network, you can hit netboot.xyz at anytime by typing:

    chain --autofree http://boot.netboot.xyz

### Operating Systems

#### What Operating Systems are currently available on netboot.xyz?

* [Arch Linux](https://www.archlinux.org)
* [CentOS](https://centos.org)
* [CoreOS](https://coreos.com/)
* [Debian](https://debian.org)
* [Fedora](https://fedoraproject.org)
* [FreeBSD](https://freebsd.org)
* [Gentoo](https://gentoo.org)
* [Kali](https://www.kali.org)
* [Mageia](http://www.mageia.org)
* [OpenBSD](http://openbsd.org)
* [OpenSUSE](http://opensuse.org)
* [RancherOS](http://rancher.com/rancher-os/)
* [Scientific](http://scientificlinux.org)
* [TinyCoreLinux](http://distro.ibiblio.org/tinycorelinux/)
* [Ubuntu](http://www.ubuntu.com/)

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

### Source Code

The source code for netboot.xyz is located [here](https://github.com/antonym/netboot.xyz).

### Contributing

New version of an OS out?  Found a new OS that works well with iPXE?  Pull requests are welcomed and encouraged and helps me out a ton!  Feel free to issue a pull request for new versions or tools that you might find useful.  Once merged into master, [Travis CI](https://travis-ci.org/antonym/netboot.xyz) will regenerate new versions of [iPXE from upstream](https://github.com/ipxe/ipxe) and deploy the latest changes to netboot.xyz.

### Testing New Branches

Under the Utilities menu on netboot.xyz, there's an option for ["Test netboot.xyz branch"](https://github.com/antonym/netboot.xyz/blob/master/src/utils.ipxe#L61).  If you've forked the code and have developed a new feature branch, you can use this option to chainload into that branch to test and validate the code.  All you need to do is specify your github user name and the name of your branch or abbreviated hash of the commit.

### Feedback

Feel free to open up an [issue](https://github.com/antonym/netboot.xyz/issues) on github or follow us on [twitter](https://twitter.com/netbootxyz).  We're also on [Freenode IRC](http://freenode.net/) in [#netbootxyz](http://webchat.freenode.net/?channels=#netbootxyz).
