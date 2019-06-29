FROM alpine:3.9
MAINTAINER Fluke667 <Fluke667@gmail.com>    
ARG TZ='Europe/Berlin'    
ENV TZ ${TZ}
ENV OPENVPN_HOME /etc/openvpn

RUN apk add --no-cache openvpn bash easy-rsa openvpn-auth-pam openvpn-auth-ldap openssl iptables openvpn-dev



WORKDIR ${OPENVPN_HOME}
EXPOSE 1194/udp

COPY start-vpn.sh /
ENTRYPOINT ["/start-vpn.sh"]
CMD ["--config", "server.conf"]
