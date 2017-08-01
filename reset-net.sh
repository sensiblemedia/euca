#!/usr/bin/bash


ifcfg_dir=/etc/sysconfig/network-scripts
cp -f ./ifcfg-em1-static ${ifcfg_dir}/ifcfg-em1
cp -f ./resolv.conf /etc/resolv.conf
brctl show
brctl delif br0 em1
brctl show
ip link set br0 down
brctl delbr br0
rm -f ${ifcfg_dir}/ifcfg-br0
systemctl restart network
