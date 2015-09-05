#!/bin/bash
# prep release for upload to production container

mkdir -p build/ipxe
git clone --depth 1 https://github.com/ipxe/ipxe.git ipxe_build
cd ipxe_build/src
for ipxe_config in `ls ../../ipxe/`
do 
  make EMBED=../../ipxe/$ipxe_config
  mv bin/ipxe.dsk ../../build/ipxe/$ipxe_config.dsk
  mv bin/ipxe.kpxe ../../build/ipxe/$ipxe_config.kpxe
  mv bin/ipxe.iso ../../build/ipxe/$ipxe_config.iso
  mv bin/ipxe.lkrn ../../build/ipxe/$ipxe_config.lkrn
  mv bin/ipxe.usb ../../build/ipxe/$ipxe_config.usb
  mv bin/undionly.kpxe ../../build/ipxe/$ipxe_config-undionly.kpxe
done
cd ../..
cp -R src/* build/
