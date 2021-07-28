FROM alpine:3.14
MAINTAINER Carlos Rubio <crubio@riskamerica.com>

RUN apk add --update openssh-client && rm -rf /var/cache/apk/*
ENV LOCAL_PORT=3306 REMOTE_PORT=3306 REMOTE_GW="" REMOTE_HOST="" USER=""
ADD startup.sh /bin/startup.sh
CMD /bin/startup.sh
