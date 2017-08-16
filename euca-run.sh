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
    echo "Starting console nginx server"
    /usr/sbin/nginx -c /etc/eucaconsole/nginx.conf
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

enable() {
    echo "Enable eucalyptus-cloud.service"
    systemctl enable eucalyptus-cloud.service
    echo "Enable eeucalyptus-cluster.service"
    systemctl enable eucalyptus-cluster.service
    echo "Enable eucanetd.service"
    systemctl enable eucanetd.service
    echo "Enable tgtd.service"
    systemctl enable tgtd.service
    echo "Enable eucalyptus-node.service"
    systemctl enable eucalyptus-node.service
    echo "Enable eucaconsole.service"
    systemctl enable eucaconsole.service
    echo "Enable console nginx server"
	RETVAL=$? 
}
disable() {
    echo "Disable eucalyptus-cloud.service"
    systemctl disable eucalyptus-cloud.service
    echo "Disable eeucalyptus-cluster.service"
    systemctl disable eucalyptus-cluster.service
    echo "Disable eucanetd.service"
    systemctl disable eucanetd.service
    echo "Disable tgtd.service"
    systemctl disable tgtd.service
    echo "Disable eucalyptus-node.service"
    systemctl disable eucalyptus-node.service
    echo "Disable eucaconsole.service"
    systemctl disable eucaconsole.service
    echo "Disable console nginx server"
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
    enable)
	    enable
	    ;;
    disable)
	    disable
	    ;;
    *)
	echo $"Usage: $prog {start|stop|restart}"
	exit 1
esac

exit $RETVAL