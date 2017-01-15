#!bin/bash

if [ ! -e /root/.homebridge/ ] then
   mkdir /root/.homebridge/
fi

if [ ! -e /mnt/homebridge/config.json ] then
   echo "[]" > /mnt/homebridge/config.json
fi

if [ ! -e /root/.homebridge/config.json ] then
  ln -s /mnt/homebridge/config.json /root/.homebridge/config.json
fi

rm /var/run/dbus/dbus_pid
rm /var/run/dbus/system_bus_socket
rm /var/run/avahi_daemon.pid

dbus-daemon --system
avahi-daemon -D
