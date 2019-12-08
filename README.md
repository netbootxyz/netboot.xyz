## netboot.xyz - v2 - Under Construction

[![Build Status](https://travis-ci.com/netbootxyz/netboot.xyz.svg?branch=master)](https://travis-ci.com/netbootxyz/netboot.xyz)
[![Discord](https://img.shields.io/discord/425186187368595466)](https://discord.gg/An6PA2a)

![netboot.xyz menu](https://netboot.xyz/images/netboot.xyz.gif)

### Bootloader Downloads

#### EFI Boot Loaders

| Type | Bootloader | Description |
|------|------------|-------------|
|ISO|[netboot.xyz-efi.iso](https://boot.netboot.xyz/ipxe/netboot.xyz-efi.iso)| Same as ISO (Legacy) but used for EFI BIOS, works in Virtual Box EFI mode |
|USB|[netboot.xyz-efi.usb](https://boot.netboot.xyz/ipxe/netboot.xyz-efi.usb)| Used for creation of USB Keys|
|DHCP| [netboot.xyz.efi](https://boot.netboot.xyz/ipxe/netboot.xyz.efi)| DHCP EFI boot image file, uses built-in iPXE NIC drivers|
|DHCP-snp|[netboot.xyz-snp.efi]() | DHCP EFI boot image file, use if you have NIC issues... need to build|

#### Legacy Boot Loaders

| Type | Bootloader | Description |
|------|------------|-------------|
|ISO| [netboot.xyz.iso](https://boot.netboot.xyz/ipxe/netboot.xyz.iso)| Used for CD/DVD, Virtual CDs like DRAC/iLO, VMware, Virtual Box (Legacy) |
|Floppy| [netboot.xyz.dsk](https://boot.netboot.xyz/ipxe/netboot.xyz.dsk)| Used for 1.44 MB floppies, Virtual floppies like DRAC/iLO, VMware, Virtual Box|
|USB| [netboot.xyz.usb](https://boot.netboot.xyz/ipxe/netboot.xyz.usb)| Used for creation of USB Keys|
|Kernel| [netboot.xyz.lkrn](https://boot.netboot.xyz/ipxe/netboot.xyz.lkrn)| Used for booting from GRUB/EXTLINUX|
|DHCP| [netboot.xyz.kpxe](https://boot.netboot.xyz/ipxe/netboot.xyz.kpxe)| DHCP boot image file, uses built-in iPXE NIC drivers|
|DHCP-undionly| [netboot.xyz-undionly.kpxe](https://boot.netboot.xyz/ipxe/netboot.xyz-undionly.kpxe)| DHCP boot image file, use if you have NIC issues|

SHA256 checksums are generated during each build of iPXE and are located [here](https://boot.netboot.xyz/ipxe/netboot.xyz-sha256-checksums.txt).  You can also view the scripts that are embedded into the images [here](https://github.com/netbootxyz/netboot.xyz/tree/master/ipxe/disks).

### What is netboot.xyz?

[netboot.xyz](http://www.netboot.xyz) is a convenient place to boot into any type of operating system or utility disk without the need of having to go spend time retrieving the ISO just to run it.  [iPXE](http://ipxe.org/) is used to provide a user friendly menu from within the BIOS that lets you easily choose the operating system you want along with any specific types of versions or bootable flags.

If you already have iPXE up and running on the network, you can hit netboot.xyz at anytime by typing:

    chain --autofree https://boot.netboot.xyz/ipxe/netboot.xyz.lkrn

or when in EFI mode:

    chain --autofree https://boot.netboot.xyz/ipxe/netboot.xyz.efi

This will load the appropriate netboot.xyz kernel with all of the proper options enabled.

### Documentation

See [netboot.xyz](https://netboot.xyz) for all documentation.  Some links to get started with are:

* [Downloads](https://netboot.xyz/downloads/)
* [Booting Methods](https://netboot.xyz/booting/)
* [FAQ](https://netboot.xyz/faq/)

If you'd like to contribute to the documentation, the netboot.xyz documenation is located at [netboot.xyz-docs](https://github.com/netbootxyz/netboot.xyz-docs).

# Self Hosting netboot.xyz

For those users who want to deploy their own netboot.xyz environment, you can leverage
the same scripts that are used to deploy the hosted environment. The source scripts are
all ansible templates and can be generated and customized to your preference.

## With Ansible

To generate, run:

```
ansible-playbook -i inventory site.yml
```

The build output will be located in /var/www/html by default.

## With Docker

```
docker build -t localbuild -f Dockerfile-build .
docker run --rm -it -v $(pwd):/buildout localbuild
```

The build output will be in the generated folder `buildout`

## Local Overides

Ansible will handle source generation as well as ipxe disk generation with your settings.  The disk generation was worked on a while back so it needs work to catch it up to the existing state of netboot.xyz.

If you want to override the defaults, you can put overrides in user_overrides.yml.  See file for examples.

Also note many user customizations are located in the boot.cfg file for the IPXE menus. A high level of customization can be achieved using our stock build output and hosting this along with the menus locally. 

## Self Hosted Custom Options

In addition to being able to host netboot.xyz locally, you can also create your own custom templates for custom menus within netboot.xyz.  Please see [Custom User Menus](etc/netbootxyz/custom/README.md) for more information.

## What Operating Systems are currently available on netboot.xyz?

### Operating Systems

| Name       | URL             | Installer Kernel | Live OS       |
|------------|-----------------|------------------|---------------|
|Alpine Linux| https://alpinelinux.org | Yes              | No            |
|Arch Linux | https://www.archlinux.org| Yes              | No            |
|BlackArch Linux|https://blackarch.org| ISO - Memdisk | No                |
|CentOS| https://centos.org | Yes | No |
|Debian| https://debian.org | Yes | Yes|
|Devuan| https://devuan.org | Yes | No |
|Elementary OS| https://elementary.io | No | Yes |
|Fedora| https://fedoraproject.org | Yes | Yes |
|Flatcar Linux|https://www.flatcar-linux.org| Yes | No |
|FreeBSD|https://freebsd.org| No, disk image | No |
|FreeDOS|http://www.freedos.org| ISO - Memdisk| No |
|Gentoo|https://gentoo.org| Not Working | No |
|IPFire|https://www.ipfire.org| Yes | No |
|Kali Linux|https://www.kali.org| Yes | Yes |
|Mageia|https://www.mageia.org| Yes | No |
|Manjaro|https://manjaro.org| No | Yes |
|Mint|https://linuxmint.com| No | Yes |
|Microsoft Windows|https://www.microsoft.com| User supplied media | No |
|MirOS|https://www.mirbsd.org| Yes | No |
|NixOS|https://nixos.org| Yes | No |
|OpenBSD|https://openbsd.org| Yes | No |
|OpenSUSE|https://opensuse.org| Yes | No |
|Parrot Security|https://www.parrotsec.org| ISO | No |
|Pop OS|https://system76.com/pop| No | Yes |
|RancherOS|https://rancher.com/rancher-os| Yes | No |
|Red Hat Enterprise Linux|https://www.redhat.com| User supplied media | No |
|Scientific Linux|https://scientificlinux.org| Yes | No |
|Slackware|https://www.slackware.com| Yes | No |
|Tails|https://tails.boum.org | No | Yes |
|Tiny Core Linux|https://tinycorelinux.net| ISO - Memdisk | No |
|Ubuntu|https://www.ubuntu.com| Yes | Yes |

### Utilities

| Name       | URL                     | Installer Kernel | Live OS |
|------------|-------------------------|------------------|---------|
|ALT Linux Rescue|https://en.altlinux.org/Rescue| ISO - Memdisk | - |
|Breakin|http://www.advancedclustering.com/products/software/breakin/| ISO - Memdisk | - |
|Clonezilla|http://www.clonezilla.org/| ISO - Memdisk | - |
|DBAN|http://www.dban.org/| ISO - Memdisk | - |
|GParted|http://gparted.org| ISO - Memdisk | - |
|Grml|http://grml.org| ISO - Memdisk | - |
|Memtest|http://www.memtest.org/| Yes | - |
|Super Grub2 Disk|http://www.supergrubdisk.org| ISO - Memdisk | - |
|Ultimate Boot CD|http://www.ultimatebootcd.com| ISO - Memdisk | - |

### Feedback

Feel free to open up an [issue](https://github.com/netbootxyz/netboot.xyz/issues) on Github, swing by [Freenode IRC](http://freenode.net/) in the [#netbootxyz](http://webchat.freenode.net/?channels=#netbootxyz) channel, or ping us on [Discord](https://discord.gg/An6PA2a).  Follow us on [Twitter](https://twitter.com/netbootxyz) or like us on [Facebook](https://www.facebook.com/netboot.xyz)!

