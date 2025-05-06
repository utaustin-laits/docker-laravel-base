#!/bin/bash

: ${WWW_UID:=33}
: ${WWW_GID:=33}

# There's an existing 'ubuntu' user with userID 1000.  If the user wants www-data to be userID 1000,
# remove 'ubuntu' so that www-data can be 1000 instead.
if [ "$WWW_UID" = "1000" ]; then
  userdel ubuntu
fi
if [ "$WWW_GID" = "1000" ]; then
  groupdel ubuntu
fi

usermod -u $WWW_UID www-data
groupmod -g $WWW_GID www-data

# Start supervisord and services
exec /usr/bin/supervisord  -n -c /etc/supervisor/supervisord.conf