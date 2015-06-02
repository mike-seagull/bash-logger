#!/bin/bash

fileloglevel=-1 # default file log is off
streamloglevel=-1 # default stream log is off

debug() {
	# debug log
	if [[ $streamloglevel -eq 0 ]]; then
		__streamlog " DEBUG:\t\t$1"
	fi
	if [[ $fileloglevel -eq 0 ]]; then
		__filelog " DEBUG:\t\t$1"
	fi
}
info() {
	# info log
	if [[ $streamloglevel -le 1 && $streamloglevel -ge 0 ]]; then
		__streamlog " INFO:\t\t$1"
	fi
	if [[ $fileloglevel -le 1 && $fileloglevel -ge 0 ]]; then
		__filelog " INFO:\t\t$1"
	fi
}
warning() {
	# warning log
	if [[ $streamloglevel -le 2  && $streamloglevel -ge 0 ]]; then
		__streamlog " WARNING:\t$1"
	fi
	if [[ $fileloglevel -le 2 && $fileloglevel -ge 0 ]]; then
		__filelog " WARNING:\t$1"
	fi
}
error() {
	# error log
	if [[ $streamloglevel -le 3  && $streamloglevel -ge 0 ]]; then
		__streamlog " ERROR:\t\t$1"
	fi
	if [[ $fileloglevel -le 3 && $fileloglevel -ge 0 ]]; then
		__filelog " ERROR:\t\t$1"
	fi
}
fatal() {
	# fatal log
	if [[ $streamloglevel -le 4  && $streamloglevel -ge 0 ]]; then
		__streamlog " FATAL:\t\t$1"
	fi
	if [[ $fileloglevel -le 4 && $fileloglevel -ge 0 ]]; then
		__filelog " FATAL:\t\t$1"
	fi
}


__streamlog() {
	# logs to file
	msg=$1
	dt=$(date '+%m/%d/%Y %H:%M:%S.%s')
	echo -e "[$dt]$msg"
}
__filelog() {
	# logs to file
	msg=$1
	dt=$(date '+%m/%d/%Y %H:%M:%S.%s')
	echo -e "[$dt]$msg" >> $logfile
}
