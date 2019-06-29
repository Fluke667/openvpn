FROM alpine:3.9
MAINTAINER Fluke667 <Fluke667@gmail.com>    
ARG TZ='Europe/Berlin'    
ENV TZ ${TZ}

RUN apk add --no-cache openvpn bash easy-rsa openvpn-auth-pam openssl
COPY data/entrypoint /entrypoint
RUN chmod 755 /entrypoint

ENV OPENVPN_HOME /etc/openvpn
WORKDIR ${OPENVPN_HOME}
EXPOSE 1194/udp

ENTRYPOINT ["/entrypoint"]
CMD ["--config", "server.conf"]
