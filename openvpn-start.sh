#!/bin/bash

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Set up NAT (masquerading) for the VPN tunnel interface (tun0)
iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE

# Allow traffic from the VPN interface to reach the rest of the system
iptables -A FORWARD -i tun0 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth0 -o tun0 -j ACCEPT

# Start OpenVPN client
openvpn --config /etc/openvpn/client.ovpn
