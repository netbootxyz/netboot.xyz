# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

## [2.0.39]
### Added
- Enabled gzip and zlib support on iPXE binaries
### Fixes
- Check for legacy undionly filename if running menu locally

## [2.0.38]
### Added
- Fedora 34 and Live Versions
- Redo Rescue
- Rescuezilla
- Rocky Linux

### Changed
- Switched to using upstream genfsimg for building hybrid images
- Merged Legacy and EFI disks into single image for USB and ISOs
- Can now use autoexec.ipxe on the root of a USB key to inject variables or modify the starting bootloader
- Renamed USB disk from .usb to .img

## [2.0.37]
### Added
- Ubuntu 21.04 Installer and Live Versions
### Fixes
- Version number variable tweaks

## [2.0.36]
### Added
- Support for ShredOS

## [2.0.35]
### Added
- Support for EndeavourOS

## [2.0.34]
### Added
- Support for AlmaLinux

### Fixes
- Updated Debian Kernel for Live images, transitioned over to Actions from Travis

## [2.0.33]
### Removed
- Parrot NetInstall images are no longer maintained
- Removed Velt as it appears deprecated

## [2.0.32]
### Fixes
- Update to latest Ubuntu maintenance release

### Changed
- Disabled Unix Menu on EFI as SmartOS not working in that mode and was the only option on EFI
- Various version updates

## [2.0.31]
### Fixes
- Fixes results too large bug introduced on Ubuntu menu

### Changed
- Change priority to low on Ubuntu Legacy installer

## [2.0.30]
### Added
- Can now download hybrid bootloaders that contain x86_64 Legacy and EFI builds in one image.
  Enables the user to use one ISO or USB key for multiple scenarios.
- Ability to use custom URLs for menus instead of just relying on Github netboot.xyz-custom repo.

### Changed
- Added the legacy installer back for Ubuntu 20.04 (Focal).  20.04 will be the last
  version to support legacy Debian Installer with autoinstall being the new Ubuntu
  standard going foward.
- Various version updates

## [2.0.29] - 2020-12-28
### Changed
- Various version updates
- Switched asset builders from Github to Travis
- Introduced changelog

## [2.0.28] - 2020-12-09
### Added
- VyOS Support

### Changed
- Switches to GitHub Actions from Travis CI for primary repo automation

## [2.0.27] - 2020-11-20
### Changed
- Change builder image name
- Remove older Kali images, fix menu for latest version
- Switch to inst.repo for Red Hat based OS
- Allow for static assigned networking to work on Ubuntu builds

## [2.0.26] - 2020-11-18
### Added
- Adds a hook in the bootloader that checks for local-vars.ipxe from a local tftp server, useful for loading up variables before loading the menu. Can be used to ensure github user is set by default for custom menus.

### Changed
- Switches builder to netbootxyz docker image on Github Container Registry
- Simplfied Fedora Live menu

### Fixed
- Bugfix on NixOS menu

## [2.0.25] - 2020-11-07
### Added
- Initial support for Raspberry Pi iPXE bootloader which allows you to boot using SD Card or USB key. (Experimental)
- Ubuntu 20.10 Grovvy Live Images
- Added support for Ubuntu 20.04/20.10 Subiquity Server installers
- Added Fedora 33 net installer and live images

### Changed
- Fedora Core build version is now updated automatically.

## [2.0.24] - 2020-10-28
### Fixed
- Fixed github releases

## [2.0.23] - 2020-10-27
### Added
- Ubuntu 20.10 Groovy Gorilla - Live CD install only
- Fedora 33
- OpenBSD 6.8

## [2.0.22] - 2020-10-11
### Fixed
- Fixed Anarchy Linux

### Changed
- Pin builders to Ansible 2.10

## [2.0.21] - 2020-09-13
### Changed
- Version updates

## [2.0.20] - 2020-08-28
### Fixed
- Archlinux url fixes

## [2.0.19] - 2020-08-12
### Added
- Adds ability to add custom kernel command line parameters

### Fixed
- Sets proper RELEASE Tag when creating a Github Release

## [2.0.18] - 2020-07-24
### Fixed
- Fixed Fedora CoreOS build
- Various unnamed bugs

## [2.0.17] - 2020-06-30
### Added
- CentOS 8.2
- Mint 20
- OpenSUSE Leap 15.2

### Changed
- Changes to K3OS deployments
- Tweaks to ARM64 menus,  added ARM placeholders for Utility menu

## [2.0.16] - 2020-06-09
### Added
- Adds Devuan back in with latest Beowulf

### Fixed
- Corrects issue with Fedora and text mode

## [2.0.15] - 2020-05-20
### Added
- Backbox 7

### Fixed
- CentOS path fixes

## [2.0.14] - 2020-05-06
### Added
- Fedora 32 and Ubuntu 20.04 live assets
- PopOS 20.04
- Parrot 4.9

### Changed
- Bump to CentOS 7.8
- Moved NixOS to hosted live assets

## [2.0.13] - 2020-04-24
### Changed
- Ubuntu 20.04 url
- NixOS 20.03

## [2.0.12] - 2020-04-23
### Added
- Ubuntu 20.04 LTS added and 20.04 stock live builds updated

### Changed
- Fedora 32 added and 29 dropped

### Removed
- Removed test forked or branched code from github as it no longer works

## [2.0.11] - 2020-04-01
### Added
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

### Fixed
- Fixed CentOS kickstart url

### Removed
- Dropped tails support

## [2.0.10] - 2020-03-07
### Changed
- Various version updates

## [2.0.9] - 2020-02-16
### Changed
- Various version updates

## [2.0.8] - 2020-02-06
### Added
- SmartOS
- 4MLinux
- BakAndImgCD
- The Smallest Server Suite

### Fixed
- Various bug fixes

## [2.0.7] - 2020-01-25
### Added
- CentOS 8.1
- Gentoo (working now)
- Fatdog
- Kaspersky Rescue Disk
- LXLE
- Live Raise
- Septor
- Tiny Core Linux using kernels instead of memdisk

## [2.0.6] - 2020-01-19
### Added
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
### Removed
- Security Menu and merges those options into Linux and Live menus
- Unused external signature checking code

## [2.0.5] - 2020-01-11
### Added
- SparkyLinux
- K3OS
- RHEL menu option back to Linux Menu
- Support for text mode on RHEL/Fedora
- netboot.xyz endpoints menu under Utilities for testing Dev/Staging/Prod endpoints
- Enables auto login for Rancher

## [2.0.4] - 2020-01-06
### Added
- PCI Device List
- VLAN Tagging Support in Manual Configuration
- DBAN
- Clonezilla
- Breakin
- FerenOS
- Q4OS 3.10

### Fixes
- FreeBSD working
- Captures upstream iPXE version as ${ipxe_version}
- Fixes Packet and GCE Versioning

## [2.0.3] - 2020-01-02
### Fixes
- Fixes for Live CD and Menus

## [2.0.2] - 2019-12-31
### Fixes
- Windows fixes, timeout for version checking
- Fixes for Deepin and Elementary

## [2.0.1] - 2019-12-27
### Fixes
- Fixes some index.html issues so that iPXE clients exit properly
- Change flags on genisoimage reflect el-torito options
- Move generate_signatures to end of playbook
- Moves retrieval of latest menu version from about to menu to ensure variable is always loaded
- Generates the version file for netboot.xyz site
- Enable epel for packages like figlet
- Fixes some discord messaging

## [2.0.0] - 2019-12-26
### Changes
- Switches primary boot.netboot.xyz to deploy deployed with Ansible and sets up 2.x rolling release series

## [1.9.9] - 2019-12-13
### Deprecated
- Pre 2.x series before being deployed with Ansible
