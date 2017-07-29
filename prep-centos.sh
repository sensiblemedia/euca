#!/usr/bin/bash

systemctl stop firewalld
systemctl disable firewalld
systemctl stop NetworkManager.service
systemctl disable NetworkManager.service
yum -y remove NetworkManager 
yum -y update
