# Teradek Sputnik
#
# Getting started:
# docker run -p 5111:5111 -p 1957:1957 --name sputnik texastribune/docker-sputnik
#
# Docs:
# http://cdn.teradek.com/Public/Sputnik/Docs/Teradek_Sputnik_Setup_Guide_v2_0512.pdf

# latest ubuntu (also a LTS)
FROM ubuntu:14.04
MAINTAINER tech@texastribune.org

RUN apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq wget libc6-i386 lib32stdc++6 lib32z1
RUN wget http://update.teradek.com/download.php?file=/Teradek/Sputnik/Software/Releases/2.1.x/2.1.0/teradek-sputnik_2.1.0.r22019_amd64.deb -q -O /tmp/teradek-sputnik.deb
RUN DEBIAN_FRONTEND=noninteractive dpkg -i /tmp/teradek-sputnik.deb
# ADD /etc/sputnik.conf
# TODO update the default conf to log to /data/log instead
VOLUME ["/var/log/"]
# TODO
# VOLUME ["/opt/teradek/sputnik/upload"]

# listening
EXPOSE 5111
# web server
EXPOSE 1957

ADD start.sh /start.sh
CMD ["/start.sh"]
