# DigitalOcean

[DigitalOcean](https://m.do.co/c/ab4e8f17ba0d) at one point had iPXE support loaded within their SeaBIOS but has since removed it.  In order to get around this, we'll have to rely on the Grub bootloader instead.

iPXE generates linux bootable kernels so that you can boot iPXE directly from Grub.  It then treats the initrd as an embedded script which contains your networking and details to load up netboot.xyz.

Tests were done using a [Fedora 23](https://getfedora.org) instance on [DigitalOcean](https://m.do.co/c/ab4e8f17ba0d).

### Download an iPXE linux kernel

Obtain an iPXE generic kernel [here](https://boot.netboot.xyz/ipxe/generic-ipxe.lkrn) or [compile your own](http://ipxe.org/download) and save it to /boot/generic-ipxe.lkrn.

### Create a netboot.xyz initrd file

The netboot.xyz initrd file contains the script necessary to bring the instance on the network and reach out to netboot.xyz.

Save as /boot/netboot.xyz-initrd (replace your networking information where appropriate):

    #!ipxe
    #/boot/netboot.xyz-initrd
    imgfree
    set net0/ip <instance public ip>
    set net0/netmask <instance public netmask>
    set net0/gateway <instance public gateway>
    set dns <instance dns address>
    ifopen net0
    chain --autofree https://boot.netboot.xyz

### Add a Grub2 custom entry

Add the following entry to /etc/grub.d/40_custom:

    #/etc/grub.d/40_custom
    menuentry 'netboot.xyz' {
        set root='hd0,msdos1'
        linux16 /boot/generic-ipxe.lkrn
        initrd16 /boot/netboot.xyz-initrd
    }

### Regenerate your grub config

Run grub2-mkconfig right after editing the configuration to add the netboot.xyz entry to your grub menu:

    grub2-mkconfig -o /boot/grub2/grub.cfg

Load up a console and then reboot from the instance to catch the menu option.  You can also change the default boot to netboot.xyz or increase the timeout if you want to be able to catch it easier.


