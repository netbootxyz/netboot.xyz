# Packet

[Packet](https://packet.net) fully supports netboot.xyz with its Custom iPXE
operating system.

### Usage

Select the "Custom iPXE" operating system from the portal, or the `custom_ipxe`
slug when using the API. 

### Provisioning

Put the netboot.xyz URL in the text field that appears in the portal, or use the
`ipxe_script_url` parameter when creating the device via the API.

    https://boot.netboot.xyz

Press "Deploy" to provision your device. It will take 2-3 minutes for the device
to become active. Once it's online, connect to Packet's out-of-band serial-over-SSH
service (S.O.S.) using the device's `id` and the facility where the device was
deployed, e.g. `ewr1`.

    ssh <device-id>@sos.<facility-code>.packet.net

The current list of facilities is [here](https://www.packet.net/locations/). The
netboot.xyz iPXE menu will appear and you can complete installation from there.

> **Please Note:** By default, devices are set to boot from the local disk. During
> provisioning, Packet sets the next boot to PXE. This happens once, which means that
> if you don't install an operating system before rebooting, it won't reload the
> netboot.xyz menu. However, you can set your device to always boot to iPXE
> first by enabling that option under 'server actions' through the customer portal.

### Networking

Devices that are provisioned via Custom iPXE will be able to DHCP for the life of
the device; however, Packet recommends configuring networking statically. IP
address information can be found by querying https://metadata.packet.net/metadata
from the host.

More information on how Packet configures bonding can be found
[here](https://www.packet.net/help/kb/how-does-the-packet-bonded-network-interface-work/).

Nameservers should be configured as:

    nameserver 147.75.207.207
    nameserver 147.75.207.208
