#!/usr/bin/bash

eval `clcadmin-assume-system-credentials`

# Setup registration of services
euserv-register-service -t user-api -h 192.168.0.5 user-api-1
euserv-register-service -t walrusbackend -h 192.168.0.5 walrus-192.168.0.5
euserv-register-service -t cluster -h 192.168.0.5 -z zone-1 cc-192.168.0.5
euserv-register-service -t storage -h 192.168.0.5 -z zone-1 sc-192.168.0.5
clusteradmin-register-nodes 192.168.0.5

# Setup DNS Domain 
euctl system.dns.dnsdomain=192.168.0.5.nip.io
euctl system.dns.dnsdomain=192.168.0.5.nip.io
euctl services.loadbalancing.dns_subdomain=lb
euctl bootstrap.webservices.use_instance_dns=true
euctl bootstrap.webservices.use_dns_delegation=true

#Setup Object Storage
euctl objectstorage.providerclient=walrus

# Setup block storage (overlay)
euctl zone-1.storage.blockstoragemanager=overlay
