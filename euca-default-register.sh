#!/usr/bin/bash

eval `clcadmin-assume-system-credentials`

# Setup registration of services
euserv-register-service -t API_192.168.0.5 -h 192.168.0.5 API_192.168.0.5
euserv-register-service -t walrusbackend -h 192.168.0.5 walrus-0
euserv-register-service -t cluster -h 192.168.0.5 -z default default-cc-0
euserv-register-service -t storage -h 192.168.0.5 -z default default-sc-0
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
euctl default.storage.blockstoragemanager=overlay
