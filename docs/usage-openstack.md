# OpenStack

**Experimental, haven't had a chance to run through this recently so YMMV.**

The netboot.xyz ISO image can be used with OpenStack clouds to boot an instance
and perform a custom installation of an operating system.

### Command line

Start by downloading the ISO and then import it into glance:

    $ wget https://boot.netboot.xyz/ipxe/netboot.xyz-dhcp.iso
    $ glance image-create --name netboot.xyz \
        --disk-format iso \
        --container-format bare \
        --file netboot.xyz-dhcp.iso \
        --visibility public
    +------------------+--------------------------------------+
    | Property         | Value                                |
    +------------------+--------------------------------------+
    | checksum         | 45cdcb89576b6c05598b11585aef46bc     |
    | container_format | bare                                 |
    | created_at       | 2016-01-27T20:02:06Z                 |
    | disk_format      | iso                                  |
    | id               | 4f11d49e-157b-4740-87ad-db7d59bb5d6d |
    | min_disk         | 0                                    |
    | min_ram          | 0                                    |
    | name             | netboot.xyz                          |
    | owner            | fbfce4cb346c4f9097a977c54904cafd     |
    | protected        | False                                |
    | size             | 1048576                              |
    | status           | active                               |
    | tags             | []                                   |
    | updated_at       | 2016-01-27T20:02:04Z                 |
    | virtual_size     | None                                 |
    | visibility       | public                               |
    +------------------+--------------------------------------+

It should only take a few seconds to import.  Take the UUID from the `id` field
returned by glance and verify that the image imported successfully:

    $ glance image-show 4f11d49e-157b-4740-87ad-db7d59bb5d6d
    +------------------+--------------------------------------+
    | Property         | Value                                |
    +------------------+--------------------------------------+
    | checksum         | 45cdcb89576b6c05598b11585aef46bc     |
    | container_format | bare                                 |
    | created_at       | 2016-01-27T20:02:06Z                 |
    | disk_format      | iso                                  |
    | id               | 4f11d49e-157b-4740-87ad-db7d59bb5d6d |
    | min_disk         | 0                                    |
    | min_ram          | 0                                    |
    | name             | netboot.xyz                          |
    | owner            | fbfce4cb346c4f9097a977c54904cafd     |
    | protected        | False                                |
    | size             | 1048576                              |
    | status           | active                               |
    | tags             | []                                   |
    | updated_at       | 2016-01-27T20:02:04Z                 |
    | virtual_size     | None                                 |
    | visibility       | public                               |
    +------------------+--------------------------------------+

The image has a status of `active`, so we know that glance imported it
properly.

Let's boot a new instance with this ISO:

    nova boot --flavor m1.small \
        --image <image-uuid-of-netbootxyz-image> \
        --nic net-id=<network-uuid> \
        netbootxyz-testing

Wait about 30 seconds, then request a console URL:

    nova get-spice-console c4ff017e-1234-4053-b740-e83eade277b9 spice-html5

Open the console URL that nova returns and you should see the familiar
netboot.xyz iPXE interface in the spice console!

### Horizon

Start by [downloading the netboot.xyz ISO](https://boot.netboot.xyz/ipxe/netboot.xyz-dhcp.iso)
to your local workstation.  Follow these steps to import the image into your
OpenStack cloud using Horizon:

* Click the _Compute_ tab on the left side, then click _Images_
* Click _Create Image_ (top right)
    * Name: `netboot.xyz ISO`
    * Image Source: Image File
    * Image File: (browse to the ISO you downloaded)
    * Format: ISO - Optical Disk Image
    * Public: Checked (optional, but recommended if you want other tenants to use
   it)
* Click _Create Image_

Wait a moment for the status to become `active`. This should only take a few
seconds.  To boot an instance with the ISO you uploaded, be sure to choose
_Boot from image_ and select _netboot.xyz ISO_ from the drop down list.
Configure networking and security groups as you normally would for any other
instance.

When the instance has fully built and gone to active status, click on the
instance name and then go to the _Console_ tab. Depending on your browser,
you may need to click the link to show only the console.

At that point, you should be able to view the netboot.xyz iPXE menu and install
your operating system.
