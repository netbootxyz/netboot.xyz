#! /bin/sh

# check for dump dir
if [ -d /buildout ]; then
  # if there are no files in that directory use 777 perms as root
  if [ `find /buildout -prune -empty 2>/dev/null` ]; then
    /bin/mkdir -p /buildout/buildout
    /bin/cp -r /mnt/* /buildout/buildout/
    /bin/chmod 777 -R /buildout/buildout
  # match the ownership of the first file we see
  else
    PERMS=`/usr/bin/find /buildout/* -print -quit |xargs stat -c "%u:%g"`
    /bin/mkdir -p /buildout/buildout
    /bin/cp -r /mnt/* /buildout/buildout/
    /bin/chown $PERMS -R /buildout/buildout
  fi
else
  /bin/echo "/buildout not found exiting"  
  exit 1
fi  
