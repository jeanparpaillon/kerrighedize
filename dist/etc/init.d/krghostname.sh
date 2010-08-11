#! /bin/sh
### BEGIN INIT INFO
# Provides:          krghostname
# Required-Start:
# Required-Stop:
# Should-Start:      hostname
# Default-Start:     S
# Default-Stop:
# Short-Description: Append node_id to hostname, in case of Kerrighed cluster
### END INIT INFO

PATH=/sbin:/bin

. /lib/init/vars.sh
. /lib/lsb/init-functions
. /lib/init/kerrighed-functions

is_kerrighed_kernel || exit 0

do_start () {
	# Append node_id to hostname
	HOSTNAME=$(hostname)$(printf '%03d' $(cat /sys/kerrighed/node_id))

	log_action_begin_msg "Setting hostname to '$HOSTNAME'"
	hostname "$HOSTNAME"
	ES=$?
	log_action_end_msg $ES
	exit $ES
}

do_status () {
	HOSTNAME=$(hostname)
	if [ "$HOSTNAME" ] ; then
		return 0
	else
		return 4
	fi
}

case "$1" in
  start|"")
	do_start
	;;
  restart|reload|force-reload)
	echo "Error: argument '$1' not supported" >&2
	exit 3
	;;
  stop)
	# No-op
	;;
  status)
	do_status
	exit $?
	;;
  *)
	echo "Usage: hostname.sh [start|stop]" >&2
	exit 3
	;;
esac

:
