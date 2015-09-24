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

# get current iPXE hash
IPXE_HASH=`git log -n 1 --pretty=format:"%H"`

# generate iPXE disks
for ipxe_config in `ls ../../ipxe/disks/`
do 
  make EMBED=../../ipxe/disks/$ipxe_config
  mv bin/ipxe.dsk ../../build/ipxe/$ipxe_config.dsk
  mv bin/ipxe.iso ../../build/ipxe/$ipxe_config.iso
  mv bin/ipxe.lkrn ../../build/ipxe/$ipxe_config.lkrn
  mv bin/ipxe.usb ../../build/ipxe/$ipxe_config.usb
  mv bin/undionly.kpxe ../../build/ipxe/$ipxe_config-undionly.kpxe
done
cd ../..

# generate header for sha256-checksums file
cat > "build/ipxe/netboot.xyz-sha256-checksums.txt" <<EOF
# netboot.xyz bootloaders generated from https://github.com/ipxe/ipxe
# Git Hash: $IPXE_HASH

EOF

# generate sha256sums for iPXE disks
for ipxe_disk in `ls build/ipxe/`
do
  sha256sum $ipxe_disk >> build/ipxe/netboot.xyz-sha256-checksums.txt
done

# copy iPXE src code into build directory
cp -R src/* build/
