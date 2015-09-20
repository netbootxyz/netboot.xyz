### Boot as a Linux Kernel from Extlinux or Grub

The ipxe.lkrn file can be booted as a Linux kernel from the bootloader.  This can be useful for providing a diagnostic tool as part of the OS or even having a quick option to reprovision the server on the fly.

#### Booting from Extlinux

Edit /boot/extlinux.conf and add a simple entry:

    LABEL ipxe-boot
          kernel /boot/ipxe.lkrn
          initrd /boot/ipxe-config.ipxe

The kernel is treated as a Linux kernel and the initrd is treated as the iPXE script that is run once the kernel has loaded.

#### Booting from Grub


