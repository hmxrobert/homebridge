FROM alpine:3.5
MAINTAINER hmxrobert

RUN apk upgrade --update
RUN apk add bash 'nodejs>=6.2.0' curl python make g++ avahi-dev dbus

RUN npm install -g homebridge
RUN npm install -g homebridge-irkit
RUN mkdir /home/.homebridge

ADD init.sh /
RUN chmod +x /init.sh

EXPOSE 5353/udp 51826

CMD ["/init.sh"]
