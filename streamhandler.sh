#!/bin/bash

source "$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)/.logging.sh"

# Log levels
# 0 = debug
# 1 = info
# 2 = warning
# 3 = error
# 4 = fatal

streamloglevel=0 # default log level is debug
setstreamloglevel() {
	# Set the log level
	level=$1
	level=$(echo "$level" | awk '{print toupper($0)}')
	if [[ "$level" == "DEBUG" ]]; then
		streamloglevel=0
	elif [[ "$level" == "INFO" ]]; then
		streamloglevel=1
	elif [[ "$level" == "WARNING" ]]; then
		streamloglevel=2
	elif [[ "$level" == "ERROR" ]]; then
		streamloglevel=3
	elif [[ "$level" == "FATAL" ]]; then
		streamloglevel=4
	fi
}