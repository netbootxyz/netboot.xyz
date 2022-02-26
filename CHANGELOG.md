# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

## [2.0.57]

## [2.0.56]
#### Fixed
- Added a ipxe_cloud_config for packet and metal for older clients
 
## [2.0.55]
#### Added
- Slackware 15.0

#### Fixed
- Hardset Flatcar Linux initrd to fix booting (https://github.com/netbootxyz/netboot.xyz/issues/1070)
- Archlinux now sets archtecture correctly with static ips

#### Changes
- Changes Packet bootloaders to Equinix Metal
- Switch archlinux default mirror to mirrors.edge.kernel.org to avoid redirect

## [2.0.54]
#### Added
- CentOS 9 Stream hardset url
- Various version updates

## [2.0.53]
#### Added
- Fedora 35
- Various version updates

## [2.0.52] - 2021-10-31
#### Added
- Support for ProxyDHCP environments

## [2.0.51] - 2021-10-15
#### Added
- Fedora CoreOS - aarch64 support
- Garuda Linux Live builds
- Ubuntu 21.10 live builds and installers
- Added Padded Floppy builds for tooling sensitive to size of disk
- Added logic for building iPXE linux binaries

#### Fixed
- Manjaro builds working again

## [2.0.50] - 2021-10-03
#### Added
- Added Clonezilla 32-bit

#### Changed
- Proper rolling for boot.netboot.xyz implemented, endpoints.yml and defaults
  are now pushed to boot.netboot.xyz upon update in development branch to
  ensure version updates can be consumed as identified. Allows for new versions
  to be available before a release.

## [2.0.49] - 2021-09-29
#### Added
- Support for Ubuntu 20.04 Subiquity and up on arm64
- Added Archlinux 32-bit
- Added shredos for 32-bit
- Added systemrescue for 32-bit
- Added Fedora 35 Beta
- Added Ubuntu 21.10 Impish Indri Beta

#### Fixes
- Corrected architecture naming on k3os

#### Changed
- Split pcbios utilities menu into 32-bit and 64-bit options
- utilitiespcbios is now utilitiespcbios64 and utilitiespcbios32 for overrides
- Renamed ubuntu netboot assets to align better with existing branches

## [2.0.48] - 2021-09-17
#### Added
- Support for Harvester
- Support for Tails
- Support for Kali 32-bit net installer
- Support for hrmpf
- Support for Gentoo 32-bit and arm64 installers
- Added EFI support for OpenBSD using sanboot
- Adds additional options for arm64 iPXE binary downloads

## [2.0.47] - 2021-08-30
#### Fixes
- Corrects an issue with loading 32-bit linux menu on 64-bit platforms (https://github.com/netbootxyz/netboot.xyz/issues/978)

## [2.0.46] - 2021-08-29
#### Fixes
- Fix incorrect arch introduced on Ubuntu

## [2.0.45] - 2021-08-29
#### Added
- Created a seperate menu for supported 32-bit Operating Systems
- Enables utility menu for Packet non EFI
- Updated arm menu

#### Fixes
- Refactor of architecture checks, better support for i386 and arch distros
- Arm64 and i386 options work now
- Added kernel_params for console overrides to utility images

#### Changed
- Dropped some older EOL distros

## [2.0.44] - 2021-08-24
#### Added
- Enables utility menu for Packet EFI
- Added Debian 11 Live Builds
- Adds Param command to iPXE builds
- Adds next-server and version info when booted locally

#### Fixes
- Fixes console issues for Ubuntu and Debian on Packet

#### Changes
- Updates to Voyager menu to let it be more dynamic

## [2.0.43] - 2021-08-19
##### Added
- Adds Proxmox VE
- Adds Zorin 16
- Adds Elementary OS 6
- Enables ability to add custom commands early in menu load with early_menu_*
- Adds ability to change install priority on Ubuntu Legacy
- Adds a toggle for enabling local-vars.ipxe

#### Fixes
- Adjustments to index.html template, adds description
- Readme tweaks for new site

## [2.0.42] - 2021-08-01
#### Added
- Debian 11 (Bullseye) ahead of release

#### Fixes
- Gentoo more reliable, switches to initrd.magic to avoid modifying initrd
- Fixes to Mint menu to populate options correctly
- Cosmetic fixes to index.html.j2 tables

## [2.0.41] - 2021-07-08
#### Added
- Adds support for openEuler
- Adds ping command to iPXE build

#### Fixes
- NixOS working again, using images and iPXE configs that are generated upstream

#### Changes
- Use non https repo for almalinux
- Switch to using initrd.magic (https://github.com/ipxe/ipxe/commit/e5f02551735922eb235388bff08249a6f31ded3d)
- Moves initrd= and cmdline values to single kernel parameter in Ansible

## [2.0.40] - 2021-06-12
#### Added
- Adds support for VMware ESXi with user supplied media

## [2.0.39] - 2021-05-15
#### Added
- Enabled gzip and zlib support on iPXE binaries
#### Fixes
- Check for legacy undionly filename if running menu locally

## [2.0.38] - 2021-05-02
#### Added
- Fedora 34 and Live Versions
- Redo Rescue
- Rescuezilla
- Rocky Linux

#### Changed
- Switched to using upstream genfsimg for building hybrid images
- Merged Legacy and EFI disks into single image for USB and ISOs
- Can now use autoexec.ipxe on the root of a USB key to inject variables or modify the starting bootloader
- Renamed USB disk from .usb to .img

## [2.0.37] - 2021-04-25
#### Added
- Ubuntu 21.04 Installer and Live Versions
#### Fixes
- Version number variable tweaks

## [2.0.36] - 2021-04-18
#### Added
- Support for ShredOS

## [2.0.35] - 2021-04-02
#### Added
- Support for EndeavourOS

## [2.0.34] - 2021-03-13
#### Added
- Support for AlmaLinux

#### Fixes
- Updated Debian Kernel for Live images, transitioned over to Actions from Travis

## [2.0.33] - 2021-03-06
#### Removed
- Parrot NetInstall images are no longer maintained
- Removed Velt as it appears deprecated

## [2.0.32] - 2021-02-09
#### Fixes
- Update to latest Ubuntu maintenance release

#### Changed
- Disabled Unix Menu on EFI as SmartOS not working in that mode and was the only option on EFI
- Various version updates

## [2.0.31] - 2021-01-18
#### Fixes
- Fixes results too large bug introduced on Ubuntu menu

#### Changed
- Change priority to low on Ubuntu Legacy installer

## [2.0.30] - 2021-01-17
#### Added
- Can now download hybrid bootloaders that contain x86_64 Legacy and EFI builds in one image.
  Enables the user to use one ISO or USB key for multiple scenarios.
- Ability to use custom URLs for menus instead of just relying on Github netboot.xyz-custom repo.

#### Changed
- Added the legacy installer back for Ubuntu 20.04 (Focal).  20.04 will be the last
  version to support legacy Debian Installer with autoinstall being the new Ubuntu
  standard going foward.
- Various version updates

## [2.0.29] - 2020-12-28
#### Changed
- Various version updates
- Switched asset builders from Github to Travis
- Introduced changelog

## [2.0.28] - 2020-12-09
#### Added
- VyOS Support

#### Changed
- Switches to GitHub Actions from Travis CI for primary repo automation

## [2.0.27] - 2020-11-20
#### Changed
- Change builder image name
- Remove older Kali images, fix menu for latest version
- Switch to inst.repo for Red Hat based OS
- Allow for static assigned networking to work on Ubuntu builds

## [2.0.26] - 2020-11-18
#### Added
- Adds a hook in the bootloader that checks for local-vars.ipxe from a local tftp server, useful for loading up variables before loading the menu. Can be used to ensure github user is set by default for custom menus.

#### Changed
- Switches builder to netbootxyz docker image on Github Container Registry
- Simplfied Fedora Live menu

#### Fixed
- Bugfix on NixOS menu

## [2.0.25] - 2020-11-07
#### Added
- Initial support for Raspberry Pi iPXE bootloader which allows you to boot using SD Card or USB key. (Experimental)
- Ubuntu 20.10 Grovvy Live Images
- Added support for Ubuntu 20.04/20.10 Subiquity Server installers
- Added Fedora 33 net installer and live images

#### Changed
- Fedora Core build version is now updated automatically.

## [2.0.24] - 2020-10-28
#### Fixed
- Fixed github releases

## [2.0.23] - 2020-10-27
#### Added
- Ubuntu 20.10 Groovy Gorilla - Live CD install only
- Fedora 33
- OpenBSD 6.8

## [2.0.22] - 2020-10-11
#### Fixed
- Fixed Anarchy Linux

#### Changed
- Pin builders to Ansible 2.10

## [2.0.21] - 2020-09-13
#### Changed
- Version updates

## [2.0.20] - 2020-08-28
#### Fixed
- Archlinux url fixes

## [2.0.19] - 2020-08-12
#### Added
- Adds ability to add custom kernel command line parameters

#### Fixed
- Sets proper RELEASE Tag when creating a Github Release

## [2.0.18] - 2020-07-24
#### Fixed
- Fixed Fedora CoreOS build
- Various unnamed bugs

## [2.0.17] - 2020-06-30
#### Added
- CentOS 8.2
- Mint 20
- OpenSUSE Leap 15.2

#### Changed
- Changes to K3OS deployments
- Tweaks to ARM64 menus,  added ARM placeholders for Utility menu

## [2.0.16] - 2020-06-09
#### Added
- Adds Devuan back in with latest Beowulf

#### Fixed
- Corrects issue with Fedora and text mode

## [2.0.15] - 2020-05-20
#### Added
- Backbox 7

#### Fixed
- CentOS path fixes

## [2.0.14] - 2020-05-06
#### Added
- Fedora 32 and Ubuntu 20.04 live assets
- PopOS 20.04
- Parrot 4.9

#### Changed
- Bump to CentOS 7.8
- Moved NixOS to hosted live assets

## [2.0.13] - 2020-04-24
#### Changed
- Ubuntu 20.04 url
- NixOS 20.03

## [2.0.12] - 2020-04-23
#### Added
- Ubuntu 20.04 LTS added and 20.04 stock live builds updated

#### Changed
- Fedora 32 added and 29 dropped

#### Removed
- Removed test forked or branched code from github as it no longer works

## [2.0.11] - 2020-04-01
#### Added
- Clonezilla Testing/Stable
- Gentoo instlaler LiveCD
- Nitrux Stable
- System Rescue CD
- Zorin Linux
- Manjaro Live CDs
- KDE-neon
- Sparky Linux Rolling and Stable
- 4mLinux core and SSS
- SmartOS version tags
- BlueStart Linux
- Parrot Linux installer
- Bodhi 5 standard and app pack
- Linux Mint Debian Edition

#### Fixed
- Fixed CentOS kickstart url

#### Removed
- Dropped tails support

## [2.0.10] - 2020-03-07
#### Changed
- Various version updates

## [2.0.9] - 2020-02-16
#### Changed
- Various version updates

## [2.0.8] - 2020-02-06
#### Added
- SmartOS
- 4MLinux
- BakAndImgCD
- The Smallest Server Suite

#### Fixed
- Various bug fixes

## [2.0.7] - 2020-01-25
#### Added
- CentOS 8.1
- Gentoo (working now)
- Fatdog
- Kaspersky Rescue Disk
- LXLE
- Live Raise
- Septor
- Tiny Core Linux using kernels instead of memdisk

## [2.0.6] - 2020-01-19
#### Added
- Oracle Linux
- Anarchy Installer
- Bluestart Live
- Zen Graphical Installer for Arch
- Kodachi Linux
- Bohdi Linux
- Boot Repair CD
- Devuan Live
- gparted Live
- grml Live
- Parrot Live
- Rescatux
- System Rescue CD
- CAINE
- Nitrux
- Velt Live
- Fedora CoreOS back in
#### Removed
- Security Menu and merges those options into Linux and Live menus
- Unused external signature checking code

## [2.0.5] - 2020-01-11
#### Added
- SparkyLinux
- K3OS
- RHEL menu option back to Linux Menu
- Support for text mode on RHEL/Fedora
- netboot.xyz endpoints menu under Utilities for testing Dev/Staging/Prod endpoints
- Enables auto login for Rancher

## [2.0.4] - 2020-01-06
#### Added
- PCI Device List
- VLAN Tagging Support in Manual Configuration
- DBAN
- Clonezilla
- Breakin
- FerenOS
- Q4OS 3.10

#### Fixes
- FreeBSD working
- Captures upstream iPXE version as ${ipxe_version}
- Fixes Packet and GCE Versioning

## [2.0.3] - 2020-01-02
#### Fixes
- Fixes for Live CD and Menus

## [2.0.2] - 2019-12-31
#### Fixes
- Windows fixes, timeout for version checking
- Fixes for Deepin and Elementary

## [2.0.1] - 2019-12-27
#### Fixes
- Fixes some index.html issues so that iPXE clients exit properly
- Change flags on genisoimage reflect el-torito options
- Move generate_signatures to end of playbook
- Moves retrieval of latest menu version from about to menu to ensure variable is always loaded
- Generates the version file for netboot.xyz site
- Enable epel for packages like figlet
- Fixes some discord messaging

## [2.0.0] - 2019-12-26
#### Changes
- Switches primary boot.netboot.xyz to deploy deployed with Ansible and sets up 2.x rolling release series

## [1.9.9] - 2019-12-13
#### Deprecated
- Pre 2.x series before being deployed with Ansible
