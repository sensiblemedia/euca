#!/usr/bin/bash

#systemctl start eucalyptus-cloud.service
systemctl start eucalyptus-cluster.service
systemctl start eucanetd.service
systemctl start tgtd.service
systemctl start eucalyptus-node.service
#systemctl start eucaconsole.service

