#!/bin/bash


iptables -X
iptables -F
iptables -Z
iptables -t nat -F
iptables -P FORWARD ACCEPT


sysctl net.ipv4.ip_forward=1


iptables -t nat -A POSTROUTING -s 10.6.0.0/24 -o eth0 -j MASQUERADE



