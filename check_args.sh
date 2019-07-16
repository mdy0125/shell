#!/bin/bash

E_WRONG_ARGS=65
script_parameters="-a -h -m -z"
#				-a=all, -h=help, and so on.

if [ $# -ne $Number_of_expected_args ]
then
	echo "Usage: 'basename $0' $script_parameters"
	# 'basename $0' is the script name
	exit $E_WRONG_ARGS
fi