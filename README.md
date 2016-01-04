## netboot.xyz

[![Build Status](https://travis-ci.org/antonym/netboot.xyz.svg?branch=master)](https://travis-ci.org/antonym/netboot.xyz) [![Doc Status](https://readthedocs.org/projects/netbootxyz/badge/?version=latest)](https://readthedocs.org/projects/netbootxyz) [![Join the chat at https://gitter.im/antonym/netboot.xyz](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/antonym/netboot.xyz?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

### Bootloaders

* ISO: [dhcp](http://boot.netboot.xyz/ipxe/netboot.xyz-dhcp.iso) | [static](http://boot.netboot.xyz/ipxe/netboot.xyz-static.iso)
* USB: [dhcp](http://boot.netboot.xyz/ipxe/netboot.xyz-dhcp.usb) | [static](http://boot.netboot.xyz/ipxe/netboot.xyz-static.usb)
* Kernel: [dhcp](http://boot.netboot.xyz/ipxe/netboot.xyz-dhcp.lkrn) | [static](http://boot.netboot.xyz/ipxe/netboot.xyz-static.lkrn)
* Checksums: [SHA256](http://boot.netboot.xyz/ipxe/netboot.xyz-sha256-checksums.txt)

![netboot.xyz menu](http://netbootxyz.readthedocs.org/en/latest/img/netboot.xyz.gif)

### What is netboot.xyz?

[netboot.xyz](http://www.netboot.xyz) is a convenient place to boot into any type of operating system or utility disk without the need of having to go spend time retrieving the ISO just to run it.  [iPXE](http://ipxe.org/) is used to provide a user friendly menu from within the BIOS that lets you easily choose the OS you want along with any specific types of versions or bootable flags.

If you already have iPXE up and running on the network, you can hit netboot.xyz at anytime by typing:

    chain --autofree http://boot.netboot.xyz

Full documentation is at ReadTheDocs:
* [http://netbootxyz.readthedocs.org/en/latest/](http://netbootxyz.readthedocs.org/en/latest/)

### What Operating Systems are available?

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

#### Feedback

Feel free to open up an issue on github or contact me at antony@mes.ser.li

#### Testing New Branches

Under the Utilities menu on netboot.xyz, there's an option for "Test netboot.xyz branch".  If you've forked the code and have developed a new feature branch, you can use this option to chainload into that branch to test and validate the code.  All you need to do is specify your github user name and the name of your branch or abbreviated hash of the commit.
