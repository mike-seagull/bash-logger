#/bin/bash

source "../logging.sh"
logfile=${filename}.log

function printMessages() {
	debug "This is a debug message"
	info "This is an info message"
	warning "This is warning message"
	error "This is an error message"
	fatal "This is a fatal message"	
	echo ""
	sleep 1
}

function cleanUp() {
	rm $logfile
}

echo -e "These should print all messages to the console and a log file \"$logfile\"\n"
printMessages

echo -e "These should print all messages except \"DEBUG\" to the console and a log file \"$logfile\"\n"
setloglevel "INFO"
printMessages

echo -e "These should print all messages except \"DEBUG\" and \"INFO\" to the console and a log file \"$logfile\"\n"
setloglevel "WARNING"
printMessages

echo -e "These should print all messages except \"DEBUG\", \"INFO\", and \"WARNING\" to the console and a log file \"$logfile\"\n"
setloglevel "ERROR"
printMessages

echo -e "These should print all messages except \"DEBUG\", \"INFO\", \"WARNING\", and \"FATAL\" to the console and a log file \"$logfile\"\n"
setloglevel "FATAL"
printMessages

cleanUp