### Boot from iPXE USB

*Warning: Backup your important data before using USB as it will overwrite anything on the USB key.*

Download a netboot.xyz disk:

* [dhcp](http://boot.netboot.xyz/ipxe/netboot.xyz-dhcp.usb) - Automatically detects your networking
* [static](http://boot.netboot.xyz/ipxe/netboot.xyz-static.usb) - Prompts for manual entry of your networking information

Insert a USB key in your compute and find the device name. Then use following command:

    cat ipxe.usb > /dev/sdX

or

    dd if=ipxe.usb of=/dev/sdX

where sdX is your usb drive.

Reboot and set your BIOS to load the USB key first if it's not set for that already.  You should see iPXE load up either load up netboot.xyz automatically or prompt you to set your networking information up.
