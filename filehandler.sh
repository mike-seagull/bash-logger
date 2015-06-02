#!/bin/bash

source "$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)/.logging.sh"
filename=$(basename "$0" | sed s/\.[^\.]*$//)
logfile="/var/log/${filename%.*}.log" # full path to the logfile

# Log levels
# 0 = debug
# 1 = info
# 2 = warning
# 3 = error
# 4 = fatal

fileloglevel=0 # default log level is debug
setfileloglevel() {
	# Set the log level
	level=$1
	level=$(echo "$level" | awk '{print toupper($0)}')
	if [[ "$level" == "DEBUG" ]]; then
		fileloglevel=0
	elif [[ "$level" == "INFO" ]]; then
		fileloglevel=1
	elif [[ "$level" == "WARNING" ]]; then
		fileloglevel=2
	elif [[ "$level" == "ERROR" ]]; then
		fileloglevel=3
	elif [[ "$level" == "FATAL" ]]; then
		fileloglevel=4
	fi
}
