#!/bin/sh
# /etc/init.d/nothing-to-see-here

### BEGIN INIT INFO
# Provides:          videoloop
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Simple script to start a program at boot
# Description:       A simple script from www.stuffaboutcode.com which will start / stop a program a boot / shutdown.
### END INIT INFO

DISPLAY=:0

# Change the next 3 lines to suit where you install your script and what you want to call it
DIR=/home/pi/nothing-to-see-here
DAEMON=$DIR/nothing-to-see-here
DAEMON_NAME=nothing-to-see-here
 
# This next line determines what user the script runs as.
# Root generally not recommended but necessary if you are using the Raspberry Pi GPIO from Python.
DAEMON_USER=pi
 
# The process ID of the script when it runs is stored here:
PIDFILE=$DIR/$DAEMON_NAME.pid
 
. /lib/lsb/init-functions
 
do_start () {
    log_daemon_msg "Starting system $DAEMON_NAME daemon"
    start-stop-daemon --start --background --pidfile $PIDFILE --make-pidfile $PIDFILE --user $DAEMON_USER --startas $DAEMON
    log_end_msg $?
}
do_stop () {
    log_daemon_msg "Stopping system $DAEMON_NAME daemon"
    start-stop-daemon --stop --pidfile $PIDFILE --retry 10
    log_end_msg $?
    #killall startvideos.sh
    #killall omxplayer.bin
}
 
case "$1" in
 
    start|stop)
        do_${1}
        ;;
 
    restart|reload|force-reload)
        do_stop
        do_start
        ;;
 
    status)
        status_of_proc "$DAEMON_NAME" "$DAEMON" && exit 0 || exit $?
        ;;
    *)
        echo "Usage: /etc/init.d/$DEAMON_NAME {start|stop|restart|status}"
        exit 1
        ;;
 
esac
exit 0