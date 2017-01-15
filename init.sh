#!/bin/sh

if [ ! -e /root/.homebridge/ ]; then
   mkdir /root/.homebridge/
fi

if [ ! -e /mnt/homebridge/config.json ]; then
   echo "[]" > /mnt/homebridge/config.json
fi

if [ ! -e /root/.homebridge/config.json ]; then
  ln -s /mnt/homebridge/config.json /root/.homebridge/config.json
fi

if [ -e /var/run/dbus_pid ]; then
  rm /var/run/dbus_pid
fi

if [ -e /var/run/dbus/system_bus_socket ]; then
  rm /var/run/dbus/system_bus_socket
fi

if [ -e /var/run/avahi_daemon/pid ]; then
  rm /var/run/avahi_daemon/pid
fi

dbus-daemon --system
avahi-daemon -D

homebridge

tail -f /dev/null
