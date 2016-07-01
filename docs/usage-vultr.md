# Vultr

[Vultr](http://www.vultr.com/?ref=6870843) has some great support for using
netboot.xyz right out of the box.

### Boot from ISO

Once you've logged into the console, select ISOs.  In the remote URLs box,
enter in the URL of a netboot.xyz ISO and press upload:

    https://boot.netboot.xyz/ipxe/netboot.xyz.iso

Go back to the main console screen and press "Deploy New Instance". Follow
these steps:

* Select _Custom_ for the operating system
* Select the ISO you uploaded
* Click _Place Order_

The instance should be online in a few minutes.  Once it's online, go to the
main account page that lists all of your instances.  Click _Manage_ next to the
instance you just launched, and then click _View Console_ under
_Server Actions_. When the console appears, you should see the netboot.xyz
iPXE menu.

When you've completed the OS installation, select _Custom ISO_ from the Server
Manager page and click _Remove ISO_.  The ISO will be removed from your
instance and it will reboot.

### Boot from iPXE Chain URL

Using an iPXE chain url may be easier for some users.  Follow these steps:

* Click _Deploy New Instance_
* Select _Custom_ for the operating system
* Select _iPXE_ in the Virtual ISO section
* Set the chain URL to `https://boot.netboot.xyz`
* Click _Place Order_

The instance will boot within a few minutes.  Once it boots, you'll have five
minutes to launch a console and choose an option from the netboot.xyz menu:

* Go back to your account home page with your instances listed
* Click _Manage_ next to the instance you just launched
* Click _View Console_ in the _Server Actions_ section
* Choose the OS you want to deploy in the netboot.xyz menu
* Complete the OS installation

Once you've finished the installation, reboot the instance as you normally
would.  Vultr will automatically reboot your virtual machine into the OS you
deployed.
