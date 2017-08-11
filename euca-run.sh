#!/usr/bin/bash

stop() {
    echo "Stopping eucaconsole.service"
    systemctl stop eucaconsole.service
    echo "Stopping eucalyptus-node.service"
    systemctl stop eucalyptus-node.service
    echo "Stopping tgtd.service"
    systemctl stop tgtd.service
    echo "Stopping eucanetd.service"
    systemctl stop eucanetd.service
    echo "Stopping eeucalyptus-cluster.service"
    systemctl stop eucalyptus-cluster.service
    echo "Stopping eucalyptus-cloud.service"
    systemctl stop eucalyptus-cloud.service
    RETVAL=$?          
    
}
start() {
    echo "Starting eucalyptus-cloud.service"
    systemctl start eucalyptus-cloud.service
    echo "Starting eeucalyptus-cluster.service"
    systemctl start eucalyptus-cluster.service
    echo "Starting eucanetd.service"
    systemctl start eucanetd.service
    echo "Starting tgtd.service"
    systemctl start tgtd.service
    echo "Starting eucalyptus-node.service"
    systemctl start eucalyptus-node.service
    echo "Starting eucaconsole.service"
    systemctl start eucaconsole.service
	RETVAL=$?
    
}

status() {
    seperator "*" 120
    echo "Status eucalyptus-cloud.service"
    systemctl status eucalyptus-cloud.service | grep -A 5 '●'
    seperator "*" 120
    echo "Status eeucalyptus-cluster.service"
    systemctl status eucalyptus-cluster.service | grep -A 5 '●'
    seperator "*" 120
    echo "Status eucanetd.service"
    systemctl status eucanetd.service | grep -A 5 '●'
    seperator "*" 120
    echo "Status tgtd.service"
    systemctl status tgtd.service | grep -A 5 '●'
    seperator "*" 120
    echo "Status eucalyptus-node.service"
    systemctl status eucalyptus-node.service | grep -A 5 '●'
    seperator "*" 120
    echo "Status eucaconsole.service"
    systemctl status eucaconsole.service | grep -A 5 '●'
	RETVAL=$?
    
}

seperator() {
    str=$1
    num=$2
    v=$(printf "%-${num}s" "$str")
    echo -e "\e[93m${v// /*}\e[39m"
}

case "$1" in
    start)
	    start
	    ;;
    stop)
	    stop
	    ;;
    status)
	    status
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