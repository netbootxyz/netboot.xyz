### Vultr

[Vultr](http://www.vultr.com/?ref=6870843) has some great support for using netboot.xyz right out of the box.  

### Boot from ISO

Once you've logged into the console, select ISOs.  In the remote URLs box, enter in the URL of a netboot.xyz DHCP ISO and press upload:

    https://boot.netboot.xyz/ipxe/netboot.xyz-dhcp.iso

Go back to the main console screen and press "Deploy New Instance".  

Under Operating Systems, select _Custom_.  Select the ISO you just uploaded and _Place Order_.  In a few minutes the instance will have booted.  You will then want to go the main console and select _Manage_ next to the instance you just launched.  Under Server Actions, select _View Console_.  At this point you should be in the netboot.xyz menu.  

You can then choose your option and install the OS of your choice.  Once you've completed installation or when you are done with netboot.xyz, select Custom ISO from the Server Manager page and click _Remove ISO_.  That will remove the ISO and reboot the instance.

### Boot from iPXE Chain URL

At the main console screen and press _Deploy New Instance_.  Under Operating Systems, select _Custom_.  Under the Virtual ISO section, select iPXE.  Set the chain URL to:

    https://boot.netboot.xyz

and _Place Order_.  In a few minutes the instance will have booted.  You will then want to go the main managemnt console and select _Manage_ next to the instance you just launched.  Under Server Actions, select _View Console_.  You should at this point be in the netboot.xyz menu.  You can then choose your option and install the OS of your choice.  Once you've completed installation or when you are done with netboot.xyz, you should be able to reboot into your OS.
