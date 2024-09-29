FROM alpine:3.18

RUN apk --no-cache add openvpn iptables bash

RUN mkdir -p /etc/openvpn
COPY client.ovpn /etc/openvpn/client.ovpn

COPY openvpn-start.sh /usr/local/bin/openvpn-start.sh
RUN chmod +x /usr/local/bin/openvpn-start.sh

CMD ["/usr/local/bin/openvpn-start.sh"]
