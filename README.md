## netboot.xyz - v2 - Under Construction

** THIS IS A WORK IN PROGRESS, DO NOT USE **

** Templates are incomplete and still being worked ** 

netboot.xyz rewritten in ansible to generate standalone netboot environments.

The goal is to use this to generate the primary netboot.xyz site 
but at the same time allow it to be customizable for any type of environment or user.

The source files are now templates in order to make things a bit easier to generate.

This is a seperate repo for now but will more than likely roll into the existing repo.

# Building locally

## With Ansible

To generate, run:

```
ansible-playbook -i inventory/all netbootxyz.yml
```

The build output will be located in /var/www/html on Debian OSs.

## With Docker

```
docker build -t localbuild -f Dockerfile-build .
docker run --rm -it -v $(pwd):/buildout localbuild
```

The build output will be in the generated folder `buildout`

## Local Overides

Ansible will handle source generation as well as ipxe disk generation with your settings.  The disk generation was worked on a while back so it needs work to catch it up to the existing state of netboot.xyz.

If you want to override the defaults, you can put overrides in user_overrides.yml.  See file for examples.

Also note many user customizations are located in the boot.cfg file for the IPXE menus. A high level of customization can be achieved using our stock build output and hosting this along with the menus locally. 

