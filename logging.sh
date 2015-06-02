#!/bin/bash

filename=$(basename "$0" | sed s/\.[^\.]*$//)
logfile="/var/log/${filename%.*}.log" # full path to the logfile


# Log levels
# 0 = debug
# 1 = info
# 2 = warning
# 3 = error
# 4 = fatal

loglevel=0 # default log level is debug
function setloglevel() {
	# Set the log level
	level=$1
	level=$(echo "$level" | awk '{print toupper($0)}')
	if [[ "$level" == "DEBUG" ]]; then
		loglevel=0
	elif [[ "$level" == "INFO" ]]; then
		loglevel=1
	elif [[ "$level" == "WARNING" ]]; then
		loglevel=2
	elif [[ "$level" == "ERROR" ]]; then
		loglevel=3
	elif [[ "$level" == "FATAL" ]]; then
		loglevel=4
	fi
}

debug() {
	# debug log
	if [[ $loglevel -eq 0 ]]; then
		__log " DEBUG:\t\t$1"
	fi
}
info() {
	# info log
	if [[ $loglevel -le 1 ]]; then
		__log " INFO:\t\t$1"
	fi
}
warning() {
	# warning log
	if [[ $loglevel -le 2 ]]; then
		__log " WARNING:\t$1"
	fi
}
error() {
	# error log
	if [[ $loglevel -le 3 ]]; then
		__log " ERROR:\t\t$1"
	fi
}
fatal() {
	# fatal log
	if [[ $loglevel -le 4 ]]; then
		__log " FATAL:\t\t$1"
	fi
}


__log(){
	# logs to file
	msg=$1
	dt=$(date '+%m/%d/%Y %H:%M:%S.%s')
	echo -e "[$dt]$msg" >> $logfile
	echo -e "[$dt]$msg"
}
