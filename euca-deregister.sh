#!/usr/bin/bash

eval `clcadmin-assume-system-credentials`

# Setup registration of services
euserv-deregister-service user-api-1
euserv-deregister-service walrus-192.168.0.5
euserv-deregister-service cc-192.168.0.5
euserv-deregister-service sc-192.168.0.5

