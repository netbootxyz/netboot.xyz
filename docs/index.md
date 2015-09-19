## What is netboot.xyz?

netboot.xyz is a convenient place to boot into any type of operating system or utility disk without the need of having to go spend time retrieving the ISO just to run it.  iPXE is used to provide a user friendly menu from within the BIOS that lets you easily choose the OS you want along with any specific types of versions or bootable flags.

You can remote attach the ISO to servers, set it up as a rescue option in Grub, or even set your home network to boot to it by default so that it's always available.

### Getting started

Grab these bootloaders and drop them into your favorite virtualization tool to start testing out netboot.xyz.  These are precompiled versions of the latest version of [iPXE](http://https://github.com/ipxe/ipxe) that will chainload you to [http://cdn.netboot.xyz/menu.ipxe](   http://cdn.netboot.xyz/menu.ipxe).  There are two versions of each, one if you have DHCP on your network, and one if you have to set a static IP before connecting outside of your network.

* ISO: [dhcp](http://cdn.netboot.xyz/ipxe/netboot.xyz-dhcp.iso) | [static](http://cdn.netboot.xyz/ipxe/netboot.xyz-static.iso)
* Floppy/USB: [dhcp](http://cdn.netboot.xyz/ipxe/netboot.xyz-dhcp.dsk) | [static](http://cdn.netboot.xyz/ipxe/netboot.xyz-dhcp.dsk)
* Linux Kernel: [dhcp](http://cdn.netboot.xyz/ipxe/netboot.xyz-dhcp.lkrn) | [static](http://cdn.netboot.xyz/ipxe/netboot.xyz-static.lkrn)

### Booting Methods
#### NIC with Embedded iPXE

If you've already compiled your own iPXE, you can load up the netboot.xyz menu easily by entering CTRL-B when prompted setting DHCP and then chainloading iPXE:

    dhcp
    chain http://cdn.netboot.xyz/menu.ipxe

If you don't have DHCP on your network, you can manually set your network information:

    set net0/ip <ip>
    set net0/netmask <netmask>
    set net0/gateway <gateway>
    set dns <nameserver>
    ifopen net0
    chain http://cdn.netboot.xyz/menu.ipxe

#### Boot from iPXE ISO

To create a bootable CD-ROM, burn the ISO image ipxe.iso (~1MB in size) to a blank CD-ROM.  You can also use this ISO file as a virtual CD device in Citrix XenServer, VMware ESXi, VMware Fusion, VirtualBox, or even in a Dell DRAC or HP iLOs virtual CD drive.

#### Boot from iPXE USB

*Warning: Backup your important data before using USB as it will overwrite anything on the USB key.*

Insert a USB disk, find it's device name of USB. Then use following command:

    cat ipxe.dsk > /dev/sdX

or

    dd if=ipxe.dsk of=/dev/sdX

where sdX is your usb drive.  Substitute /dev/sdX for /dev/fd0 in the case of using a floppy.

### Operating Systems

#### What Operating Systems are currently available on netboot.xyz?

* [ArchLinux](https://www.archlinux.org)
* [CentOS](https://centos.org)
* [CoreOS](https://coreos.com/)
* [Debian](https://debian.org)
* [Fedora](https://fedoraproject.org)
* [FreeBSD](https://freebsd.org)
* [Gentoo](https://gentoo.org)
* [OpenBSD](http://openbsd.org)
* [OpenSUSE](http://opensuse.org)
* [RancherOS](http://rancher.com/rancher-os/)
* [Scientific](http://scientificlinux.org)
* [TinyCoreLinux](http://distro.ibiblio.org/tinycorelinux/)
* [Ubuntu](http://www.ubuntu.com/)

#### Utilities

* [Clonezilla](http://www.clonezilla.org/)
* [HDT](http://www.hdt-project.org/)
* [Memtest](http://www.memtest.org/)

### Contributing

Pull requests are welcome and encouraged.  Feel free to issue a pull request for new versions or tools that you might find useful.  Once merged into master, travis-ci will regenerate new versions of iPXE from upstream and deploy the latest changes to netboot.xyz.

Feel free to open up an issue on github or contact us via <antony@mes.ser.li>.
