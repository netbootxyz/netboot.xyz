## netboot.xyz

[![Build Status](https://github.com/netbootxyz/netboot.xyz/workflows/release/badge.svg)](https://github.com/netbootxyz/netboot.xyz/actions?query=workflow%3Arelease)
[![Discord](https://img.shields.io/discord/425186187368595466)](https://discord.gg/An6PA2a)
[![Release](https://img.shields.io/github/v/release/netbootxyz/netboot.xyz?color=hunter%20green)](https://github.com/netbootxyz/netboot.xyz/releases/latest)

![netboot.xyz menu](https://netboot.xyz/images/netboot.xyz.gif)

### Bootloader Downloads

#### Legacy (PCBIOS) iPXE Bootloaders

| Type | Bootloader | Description |
|------|------------|-------------|
|ISO| [netboot.xyz.iso](https://boot.netboot.xyz/ipxe/netboot.xyz.iso)| Used for CD/DVD, Virtual CDs, DRAC/iLO, VMware, Virtual Box |
|USB| [netboot.xyz.usb](https://boot.netboot.xyz/ipxe/netboot.xyz.usb)| Used for creation of USB Keys|
|Kernel| [netboot.xyz.lkrn](https://boot.netboot.xyz/ipxe/netboot.xyz.lkrn)|Used for booting from GRUB/EXTLINUX|
|Floppy| [netboot.xyz.dsk](https://boot.netboot.xyz/ipxe/netboot.xyz.dsk)| Virtual floppy disk for DRAC/iLO, VMware, Virtual Box, etc|
|DHCP| [netboot.xyz.kpxe](https://boot.netboot.xyz/ipxe/netboot.xyz.kpxe)| DHCP boot image file, uses built-in iPXE NIC drivers|
|DHCP-undionly| [netboot.xyz-undionly.kpxe](https://boot.netboot.xyz/ipxe/netboot.xyz-undionly.kpxe)| DHCP boot image file, use if you have NIC issues|

#### UEFI iPXE Bootloaders

| Type | Bootloader | Description |
|------|------------|-------------|
|ISO| [netboot.xyz-efi.iso](https://boot.netboot.xyz/ipxe/netboot.xyz-efi.iso)| Used for CD/DVD, Virtual CDs, DRAC/iLO, VMware, Virtual Box |
|USB| [netboot.xyz-efi.usb](https://boot.netboot.xyz/ipxe/netboot.xyz-efi.usb)| Used for creation of USB Keys|
|DHCP| [netboot.xyz.efi](https://boot.netboot.xyz/ipxe/netboot.xyz.efi)| DHCP boot image file, uses built-in iPXE NIC drivers|
|DHCP-snp |	[netboot.xyz-snp.efi](https://boot.netboot.xyz/ipxe/netboot.xyz-snp.efi)| EFI w/ Simple Network Protocol, attempts to boot all net devices|
|DHCP-snponly | [netboot.xyz-snponly.efi](https://boot.netboot.xyz/ipxe/netboot.xyz-snponly.efi)| EFI w/ Simple Network Protocol, only boots from device chained from|

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
* [Self Hosting](https://netboot.xyz/selfhosting/)
* [Booting Methods](https://netboot.xyz/booting/)
* [FAQ](https://netboot.xyz/faq/)
* [Blog](https://blog.netboot.xyz/)

If you'd like to contribute to the documentation, the netboot.xyz documentation is located at [netboot.xyz-docs](https://github.com/netbootxyz/netboot.xyz-docs).

### Self Hosting netboot.xyz

For those users who want to deploy their own netboot.xyz environment,  you can leverage the same scripts that are used to deploy the hosted environment. The source scripts are all Ansible templates and can be generated and customized to your preference.

Please see the [self-hosting docs](https://netboot.xyz/selfhosting/) for more information but in short:

#### Deploying using Ansible

To generate, run:

```
ansible-playbook -i inventory site.yml
```

The build output will be located in /var/www/html by default.

#### Deploying with Docker

```
docker build -t localbuild -f Dockerfile-build .
docker run --rm -it -v $(pwd):/buildout localbuild
```

The build output will be in the generated folder `buildout`

#### Local Overrides

Ansible will handle source generation as well as iPXE disk generation with your settings.  It will generate Legacy (PCBIOS) and UEFI iPXE disks that can be used to load into your netboot.xyz environment. If you want to override the defaults, you can put overrides in user_overrides.yml.  See `user_overrides.yml` for examples. 

Using the overrides file, you can override all of the settings from the defaults/main.yml so that you can easily change the boot mirror URLs when the menus are rendered.  If you prefer to do this after the fact, you can also edit the boot.cfg to make changes, but keep in mind those changes will not be saved when you redeploy the menu.

#### Self Hosted Custom Options

In addition to being able to host netboot.xyz locally, you can also create your own custom templates for custom menus within netboot.xyz.  Please see [Custom User Menus](etc/netbootxyz/custom/README.md) for more information.

### What Operating Systems are currently available on netboot.xyz?

#### Operating Systems

| Name       | URL             | Installer Kernel | Live OS       |
|------------|-----------------|------------------|---------------|
| AlmaLinux | https://almalinux.org/ | Yes | No |
| Alpine Linux | https://alpinelinux.org | Yes | No |
| Anarchy Linux | https://anarchyinstaller.org | Yes | No |
| Arch Linux | https://www.archlinux.org | Yes | No |
| Backbox | https://www.backbox.org | No | Yes |
| BlackArch Linux | https://blackarch.org | Yes | Yes |
| Bluestar Linux | https://sourceforge.net/projects/bluestarlinux | No | Yes |
| Bodhi Linux | https://www.bodhilinux.com | No | Yes |
| CentOS | https://centos.org | Yes | No |
| CoreOS | http://coreos.com/ | Yes | No |
| Debian | https://debian.org | Yes | Yes|
| Deepin | https://www.deepin.org | No | Yes |
| Devuan | https://devuan.org | Yes | No |
| Elementary OS | https://elementary.io | No | Yes |
| EndeavourOS | https://endeavouros.com | No | Yes |
| Fatdog64 | https://distro.ibiblio.org/fatdog/web/ | No | Yes |
| Fedora | https://fedoraproject.org | Yes | Yes |
| Feren OS | https://ferenos.weebly.com/ | Yes | No |
| Flatcar Linux | https://www.flatcar-linux.org | Yes | No |
| FreeBSD | https://freebsd.org | Yes, disk image | No |
| FreeDOS | http://www.freedos.org | ISO - Memdisk| No |
| Gentoo | https://gentoo.org | Yes | Yes |
| IPFire | https://www.ipfire.org | Yes | No |
| Kali Linux | https://www.kali.org | Yes | Yes |
| KDE Neon | https://neon.kde.org | No | Yes |
| Kodachi | https://www.digi77.com/linux-kodachi/ | No | Yes |
| Linux Lite | https://www.linuxliteos.com | No | Yes |
| LXLE | https://lxle.net/ | No | Yes |
| Mageia | https://www.mageia.org | Yes | No |
| Manjaro | https://manjaro.org | No | Yes |
| Mint | https://linuxmint.com | No | Yes |
| Microsoft Windows | https://www.microsoft.com | User supplied media | No |
| MirOS | https://www.mirbsd.org | Yes | No |
| Nitrux | https://nxos.org/ | No | Yes |
| NixOS | https://nixos.org | Yes | No |
| OpenBSD | https://openbsd.org | Yes | No |
| OpenSUSE | https://opensuse.org | Yes | No |
| Oracle Linux | https://www.oracle.com/linux/ | Yes | Installer |
| Parrot Security | https://www.parrotsec.org | No | Yes |
| Peppermint | https://peppermintos.com | No | Yes |
| Pop OS |https://system76.com/pop| No | Yes |
| Q4OS | https://q4os.org | No | Yes |
| Raizo | https://sourceforge.net/projects/live-raizo/ | No | Yes |
| RancherOS | https://rancher.com/rancher-os | Yes | No |
| Red Hat Enterprise Linux | https://www.redhat.com | User supplied media | No |
| Regolith | https://regolith-linux.org | No | Yes |
| Scientific Linux | https://scientificlinux.org | Yes | No |
| Septor | https://septor.sourceforge.io | No | Yes |
| Slackware | https://www.slackware.com | Yes | No |
| SmartOS | https://www.joyent.com/smartos | Yes | No |
| SparkyLinux | https://sparkylinux.org/ | No | Yes |
| Talos | https://www.talos.dev/ | Yes | No |
| Tiny Core Linux | https://tinycorelinux.net | Yes | Yes |
| Ubuntu | https://www.ubuntu.com | Yes | Yes |
| Voyager | https://voyagerlive.org | No | Yes |
| VyOS | https://vyos.io | Yes | No |
| Zen Installer | https://sourceforge.net/projects/revenge-installer | Yes | No |
| Zorin OS | https://zorinos.com | No | Yes |

### Utilities

| Name       | URL                     | Type |
|------------|-------------------------|------|
| 4MLinux | https://4mlinux.com/ | Kernel/Initrd |
| ALT Linux Rescue | https://en.altlinux.org/Rescue | ISO - Memdisk |
| BakAndImgCD | https://bakandimgcd.4mlinux.com/ | Kernel/Initrd |
| Boot Repair CD | https://sourceforge.net/projects/boot-repair-cd/ | LiveCD |
| Breakin | http://www.advancedclustering.com/products/software/breakin/ | Kernel/Initrd |
| CAINE | https://www.caine-live.net/ | LiveCD |
| Clonezilla | http://www.clonezilla.org/ | LiveCD |
| DBAN | http://www.dban.org/ | Kernel |
| GParted | http://gparted.org | LiveCD |
| Grml | http://grml.org | LiveCD |
| Kaspersky Rescue Disk | https://support.kaspersky.com/viruses/krd18 | LiveCD |
| Memtest | http://www.memtest.org/ | Kernel |
| Rescatux | https://www.supergrubdisk.org/rescatux/ | LiveCD |
| Super Grub2 Disk | http://www.supergrubdisk.org | ISO - Memdisk |
| System Rescue | https://system-rescue.org/ | LiveCD |
| The Smallest Server Suite | https://thesss.4mlinux.com/ | Kernel/Initrd |
| Ultimate Boot CD | http://www.ultimatebootcd.com | ISO - Memdisk |

### Feedback

Feel free to open up an [issue](https://github.com/netbootxyz/netboot.xyz/issues) on Github or ping us on [Discord](https://discord.gg/An6PA2a).  Follow us on [Twitter](https://twitter.com/netbootxyz) and like us on [Facebook](https://www.facebook.com/netboot.xyz)!
