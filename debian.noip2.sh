#!/bin/bash

### BEGIN INIT INFO
# Provides:        noip2
# Required-Start:  $network $remote_fs $syslog pppd
# Required-Stop:   $network $remote_fs $syslog
# Default-Start:   2 3 4 5
# Default-Stop:
# Short-Description: Start NOIP2 daemon
### END INIT INFO

# Supplied by no-ip.com
# Modified for Debian GNU/Linux by Eivind L. Rygge <eivind@rygge.org>
# corrected 1-17-2004 by Alex Docauer <alex@docauer.net>

# . /etc/rc.d/init.d/functions  # uncomment/modify for your killproc

DAEMON=/opt/bin/noip2
NAME=noip2
OPTS=""

test -x $DAEMON || exit 0

case "$1" in
    start)
    echo -n "Starting dynamic address update: "
    start-stop-daemon --start --exec $DAEMON -- $OPTS
    echo "noip2."
    ;;
    stop)
    echo -n "Shutting down dynamic address update:"
    start-stop-daemon --stop --oknodo --retry 30 --exec $DAEMON
    echo "noip2."
    ;;

    restart)
    echo -n "Restarting dynamic address update: "
    start-stop-daemon --stop --oknodo --retry 30 --exec $DAEMON
    start-stop-daemon --start --exec $DAEMON -- $OPTS
    echo "noip2."
    ;;

    *)
    echo "Usage: $0 {start|stop|restart}"
    exit 1
esac
exit 0

