# iPXE

### NIC with Embedded iPXE

If you've already compiled your own iPXE, you can load up the netboot.xyz menu easily by entering CTRL-B when prompted setting DHCP and then chainloading iPXE:

    dhcp
    chain --autofree https://boot.netboot.xyz

If you don't have DHCP on your network, you can manually set your network information:

    set net0/ip <ip>
    set net0/netmask <netmask>
    set net0/gateway <gateway>
    set dns <nameserver>
    ifopen net0
    chain --autofree https://boot.netboot.xyz
