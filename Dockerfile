FROM archlinuxjp/archlinux:2017.01.15
MAINTAINER hmxrobert

#RUN apk upgrade --update
#RUN apk add bash 'nodejs>=6.2.0' curl python make g++ avahi-dev dbus libnss-mdns

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm nodejs npm python2 make gcc avahi nss-mdns

RUN npm install -g node-gyp
RUN npm install -g homebridge
RUN npm install -g homebridge-irkit
RUN mkdir /home/.homebridge

ADD init.sh /
RUN chmod +x /init.sh

ADD nsswitch.conf /etc/

EXPOSE 5353/udp 51826

CMD ["/init.sh"]
#CMD ["/bin/sh"]
