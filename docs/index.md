## netboot.xyz 
[![Build Status](https://travis-ci.org/antonym/netboot.xyz.svg?branch=master)](https://travis-ci.org/antonym/netboot.xyz) [![Join the chat at https://gitter.im/antonym/netboot.xyz](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/antonym/netboot.xyz?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

![netboot.xyz menu](img/netboot.xyz.gif)

### Bootloader Downloads

These iPXE disks will automatically load into [boot.netboot.xyz](http://boot.netboot.xyz):

* ISO [ [dhcp](http://boot.netboot.xyz/ipxe/netboot.xyz-dhcp.iso) | [static](http://boot.netboot.xyz/ipxe/netboot.xyz-static.iso) ] - Typically used for CD/DVD, Virtual CDs like DRAC/iLO, VMware, Virtual Box
* USB [ [dhcp](http://boot.netboot.xyz/ipxe/netboot.xyz-dhcp.usb) | [static](http://boot.netboot.xyz/ipxe/netboot.xyz-static.usb) ] - Used for creation of USB Keys
* Kernel [ [dhcp](http://boot.netboot.xyz/ipxe/netboot.xyz-dhcp.lkrn) | [static](http://boot.netboot.xyz/ipxe/netboot.xyz-static.lkrn) ] - Used for GRUB/EXTLINUX
* DHCP [ [dhcp](http://boot.netboot.xyz/ipxe/netboot.xyz-dhcp.kpxe) | [dhcp-undionly](http://boot.netboot.xyz/ipxe/netboot.xyz-dhcp-undionly.kpxe) ] - Used for a DHCP boot image file, use undionly if you have NIC issues
* Checksums [ [SHA256](http://boot.netboot.xyz/ipxe/netboot.xyz-sha256-checksums.txt) ] - Checksums are generated during iPXE compile on Travis CI

You can view the scripts that are embedded into the images [here](https://github.com/antonym/netboot.xyz/tree/master/ipxe/disks).

### What is netboot.xyz?

[netboot.xyz](http://www.netboot.xyz) is a way to select various operating system installers or utilities from one place within the BIOS without the need of having to go retrieve the media to run the tool.  [iPXE](http://ipxe.org/) is used to provide a user friendly menu from within the BIOS that lets you easily choose the OS you want along with any specific types of versions or bootable flags.

You can remote attach the ISO to servers, set it up as a rescue option in Grub, or even set up your home network to boot to it by default so that it's always available.

### Getting started

Download the bootloader of your choice from the links above and add it to your favorite virtualization tool to start testing out netboot.xyz.  These are precompiled versions of the latest version of [iPXE](http://https://github.com/ipxe/ipxe) that will chainload you to [http://boot.netboot.xyz](http://boot.netboot.xyz).  There are two versions of each, one if you have DHCP on your network, and one if you have to set a static IP before connecting outside of your network.

If you already have iPXE up and running on the network, you can hit netboot.xyz at anytime by typing:

    chain --autofree http://boot.netboot.xyz

### Operating Systems

#### What Operating Systems are currently available on netboot.xyz?

* [ArchLinux](https://www.archlinux.org)
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
* [WinPE](http://www.microsoft.com/)

#### Utilities

* [Clonezilla](http://www.clonezilla.org/)
* [GParted](http://gparted.org)
* [HDT](http://www.hdt-project.org/)
* [Memtest](http://www.memtest.org/)
* [Partition Wizard](http://www.partitionwizard.com)

### Source Code

The source code for netboot.xyz is located [here](https://github.com/antonym/netboot.xyz).

### Contributing

New version of an OS out?  Found a new OS that works well with iPXE?  Pull requests are welcomed and encouraged and helps me out a ton!  Feel free to issue a pull request for new versions or tools that you might find useful.  Once merged into master, [Travis CI](https://travis-ci.org/antonym/netboot.xyz) will regenerate new versions of [iPXE from upstream](https://github.com/ipxe/ipxe) and deploy the latest changes to netboot.xyz.

### Testing New Branches

Under the Utilities menu on netboot.xyz, there's an option for ["Test netboot.xyz branch"](https://github.com/antonym/netboot.xyz/blob/master/src/utils.ipxe#L61).  If you've forked the code and have developed a new feature branch, you can use this option to chainload into that branch to test and validate the code.  All you need to do is specify your github user name and the name of your branch or abbreviated hash of the commit.

### Feedback

Feel free to open up an issue on github or contact me at <antony@mes.ser.li>.
