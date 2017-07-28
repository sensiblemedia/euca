#!/usr/bin/bash

systemctl status eucalyptus-cloud.service
systemctl status eucalyptus-cluster.service
systemctl status eucanetd.service
systemctl status tgtd.service
systemctl status eucalyptus-node.service
systemctl status eucaconsole.service

