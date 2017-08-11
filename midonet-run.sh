#!/usr/bin/bash

stop() {
    echo "Stopping midolman.service"
    systemctl stop midolman.service
    echo "Stopping mimidonet-cluster.service"
    systemctl stop midonet-cluster.service
    echo "Stopping cassandra.servicee"
    systemctl stop cassandra.service
    echo "Stopping zookeeper.service"
    systemctl stop zookeeper.service 
    RETVAL=$?          
    
}
start() {
    echo "Starting zookeeper.service"
    systemctl start zookeeper.service
    echo "Starting cassandra.service"
    systemctl start cassandra.service
    echo "Starting mimidonet-cluster.service"      
    systemctl start midonet-cluster.service
    echo "Starting midolman.service"
    systemctl start midolman.service
	RETVAL=$?
    
}

case "$1" in
    start)
	    start
	    ;;
    stop)
	    stop
	    ;;
    restart)
	    stop
	    start
	    ;;
    *)
	echo $"Usage: $prog {start|stop|restart}"
	exit 1
esac

exit $RETVAL