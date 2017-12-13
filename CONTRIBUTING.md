# Contributing to netboot.xyz

Thanks for supporting netboot.xyz, and for considering contributing to the
project!

## How to Contribute

Because netboot.xyz supports many different operating systems and utilities, it
takes work and time to keep the many options updated.  Distributions may add a
new version of the operating system, locations of files can change, and versions
might go end of life and drop off the mirrors.

The end goal is to support as many operating systems as possible so that it's
really easy to go explore new operating systems and tools from one location.

## So what can I do to help?

### Help keep netboot.xyz updated

If you noticed one of your favorite operating system or tool has been updated,
feel free to open a Pull Request to get the operating system updated.  It will
be reviewed and merged once validated.

### Add support for new OS and Utilities

Do you have a favorite utility that you use often but isn't on netboot.xyz?
Feel free to request it being added or submit a Pull Request.

### Ask your distribution to become netboot friendly

If you don't see support for your favorite distribution in netboot.xyz, please
open up an issue with netboot.xyz and if possible, open up an issue with the
distribution.

Ask for the distribution to provide a way to load installer kernels from
their mirror directly or provide key files from their release ISO somewhere that
is accessible over HTTP.  This usually might be a `vmlinuz`, an `initrd`, and
potentially a `rootfs` and could be extracted and hosted on the mirror when the
release is generated.  Providing these allows not only netboot.xyz to load the
installer from a supported and trusted location but also users to do the same
from their own PXE servers.  In this day and age as physical media is less
necessary, having the option to pull files as needed is much more efficient
especially when you may have limited bandwidth.

### Submit ideas

I'm always looking for new ideas to make the tool more useful, if you have an
idea, feel free to open up a [Github Issue](https://github.com/antonym/netboot.xyz/issues/new)
or open up a [Pull Request](https://github.com/antonym/netboot.xyz/pulls).

## Enjoy and have fun!
