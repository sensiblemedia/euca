#!/usr/bin/bash

# Configure Euca package repository
yum install http://downloads.eucalyptus.com/software/eucalyptus/4.4/rhel/7/x86_64/eucalyptus-release-4.4-1.el7.noarch.rpm
# Configure euca2ools package repository
yum install http://downloads.eucalyptus.com/software/euca2ools/3.4/rhel/7/x86_64/euca2ools-release-3.4-1.el7.noarch.rpm
# Configure EPEL package repository
yum install http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# Euca node controller
yum install eucalyptus-node

virsh net-destroy default
virsh net-autostart default --disable

ls -l /dev/kvm

# Install CLC (Cloud Controller)
yum install eucalyptus-cloud
# Install backend service image package on CLC
yum install eucalyptus-service-image
# Instal UFS host machine 
yum install eucalyptus-cloud
# Install Console
yum install eucaconsole

# Install remaining service 
yum install eucalyptus-cluster eucalyptus-sc eucalyptus-walrus

# Configure SELinux to allow EBS volumes
setsebool -P eucalyptus_storage_controller 1

# For each Managment Console to allow HTTP proxy to access back end.
setsebool -P httpd_can_network_connect 1

# If employing VPCMIDO on the CLC execute:
setsebool -P httpd_can_network_connect 1

# For Eucalyptus images decompresion see http://emis.eucalyptus.com/ 
yum -y install -y xz
# bash <(curl -Ls  http://eucalyptus.com/install-emis)

