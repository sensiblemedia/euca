#!/usr/bin/bash

systemctl stop eucalyptus-cloud.service
systemctl stop eucalyptus-cluster.service
systemctl stop eucanetd.service
systemctl stop tgtd.service
systemctl stop eucalyptus-node.service
systemctl stop eucaconsole.service

