#!/bin/bash

LOG_DIR=/var/log
ROOT_UID=0			# UID is 0 it is the root
LINES=50			# default save lines
E_XCD=66			# can't change directory?
E_NOTROOT=67		# is not root so quit

# use root
if [ "$UID" -ne "ROOT_UID" ]
then
	echo "Must be root to run this script"
	exit $E_NOTROOT
fi

if [ -n "$S1" ]
then
	lines=$s1
else
	lines=$LINES
fi

# to check if the first param is a num or not.
# case "$S1" in
# ""		) lines=50;;
# *[!0-9]*	) echo "USage: 'basename $0' file-to-cleanup"; exit $E_WRONGARGS;;
# *			) lines=$1;;
# esac

cd $LOG_DIR

if [ 'pwd' != "$LOG_DIR" ]
then
	echo "can't change to $LOG_DIR"
	exit $E_XCD
fi

# more effective
# cd /var/log || {
# 	echo "Cannot change to necessary directory" > &2
# 	exit $E_XCD;
# }

tail -$lines messages > mesg.temp # save the last $LINES messages.
mv mesg.tmp messages

cat /dev/null > wtmp  #?
echo "Logs cleaned up."

exit 0