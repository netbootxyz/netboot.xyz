#!/bin/bash
# prep release for upload to production container

# make ipxe directory to store ipxe disks
mkdir -p build/ipxe

# pull down upstream iPXE
git clone --depth 1 https://github.com/ipxe/ipxe.git ipxe_build

# copy iPXE config overrides into source tree
cp ipxe/local/* ipxe_build/src/config/local/

# build iPXE disks
cd ipxe_build/src
for ipxe_config in `ls ../../ipxe/`
do 
  make EMBED=../../ipxe/$ipxe_config
  mv bin/ipxe.dsk ../../build/ipxe/$ipxe_config.dsk
  mv bin/ipxe.iso ../../build/ipxe/$ipxe_config.iso
  mv bin/ipxe.lkrn ../../build/ipxe/$ipxe_config.lkrn
  mv bin/ipxe.usb ../../build/ipxe/$ipxe_config.usb
  mv bin/undionly.kpxe ../../build/ipxe/$ipxe_config-undionly.kpxe
done
cd ../..

# copy iPXE src code into build directory
cp -R src/* build/
