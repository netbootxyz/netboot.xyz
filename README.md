## netboot.xyz

[![Build Status](https://travis-ci.org/antonym/netboot.xyz.svg?branch=master)](https://travis-ci.org/antonym/netboot.xyz) [![Doc Status](https://readthedocs.org/projects/netbootxyz/badge/?version=latest)](https://readthedocs.org/projects/netbootxyz) [![Join the chat at https://gitter.im/antonym/netboot.xyz](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/antonym/netboot.xyz?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

![netboot.xyz menu](http://netbootxyz.readthedocs.org/en/latest/img/netboot.xyz.gif)

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

[netboot.xyz](http://www.netboot.xyz) is a convenient place to boot into any type of operating system or utility disk without the need of having to go spend time retrieving the ISO just to run it.  [iPXE](http://ipxe.org/) is used to provide a user friendly menu from within the BIOS that lets you easily choose the OS you want along with any specific types of versions or bootable flags.

If you already have iPXE up and running on the network, you can hit netboot.xyz at anytime by typing:

    chain --autofree http://boot.netboot.xyz

Full documentation is at ReadTheDocs:
* [http://netbootxyz.readthedocs.org/en/latest/](http://netbootxyz.readthedocs.org/en/latest/)

### What Operating Systems are available?

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

* [Clonezilla](http://www.clonezilla.org/)
* [DBAN](http://www.dban.org/)
* [GParted](http://gparted.org)
* [HDT](http://www.hdt-project.org/)
* [Memtest](http://www.memtest.org/)
* [Partition Wizard](http://www.partitionwizard.com)

#### Feedback

Feel free to open up an [issue](https://github.com/antonym/netboot.xyz/issues) on github or follow us on [twitter](https://twitter.com/netbootxyz).

#### Testing New Branches

Under the Utilities menu on netboot.xyz, there's an option for "Test netboot.xyz branch".  If you've forked the code and have developed a new feature branch, you can use this option to chainload into that branch to test and validate the code.  All you need to do is specify your github user name and the name of your branch or abbreviated hash of the commit.
