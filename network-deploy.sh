#!/usr/bin/bash

Create static uplink veth pair:
ip link add type veth
ip link set dev veth0 up
ip link set dev veth1 up

# Create Bridge
brctl addbr uplinkbridge
brctl addif uplinkbridge veth0
ip addr add 172.19.0.1/30 dev uplinkbridge
ip link set dev uplink bridge up

# Create Static Routes
for i in {10..40}; do ip route add 192.168.0.${i}/32 via 172.19.0.2 ; done

# Setup iptable rules
for i in {10..40}; do iptables -t nat -I POSTROUTING -o br0 -s 192.168.0.$i/32 -j MASQUERADE ; iptables -I FORWARD -s 192.168.0.$i/32 -j ACCEPT; done
