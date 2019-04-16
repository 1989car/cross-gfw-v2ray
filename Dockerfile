# V2Ray Dockerfile
#
# Version: 1.3.0

FROM ubuntu:18.04
MAINTAINER Haojia Che <haojia.che@outlook.com>

# environment
ENV V2RAY_VERSION 4.18.0
ENV V2RAY_PORT 1234
ENV V2RAY_ALTERID 1234
ENV SS_PORT 4321
ENV SS_PASSWD passwd
ENV SS_METHOD aes-128-cfb

# install git & curl & unzip & daemon
RUN apt-get -qq update && \
    apt-get install -q -y git curl unzip daemon

# run install script
RUN mkdir -p /usr/v2ray/
ADD install-release.sh /usr/v2ray/install-release.sh
ADD config.json /usr/v2ray/config.json
RUN chmod +x /usr/v2ray/install-release.sh

EXPOSE $V2RAY_PORT
EXPOSE $SS_PORT

CMD ["bash", "/usr/v2ray/install-release.sh"]
