#!/bin/bash

source "../filehandler.sh"
logfile=${filename}.log

function printMessages() {
	debug "This is a debug message"
	info "This is an info message"
	warning "This is warning message"
	error "This is an error message"
	fatal "This is a fatal message"	
	echo ""
}

function cleanUp() {
	rm $logfile
}

echo -e "These should print all messages to the file \"$logfile\"\n"
printMessages

echo -e "These should print all messages except \"DEBUG\" to the file \"$logfile\"\n"
setfileloglevel "INFO"
printMessages

echo -e "These should print all messages except \"DEBUG\" and \"INFO\" to the file \"$logfile\"\n"
setfileloglevel "WARNING"
printMessages

echo -e "These should print all messages except \"DEBUG\", \"INFO\", and \"WARNING\" to the file \"$logfile\"\n"
setfileloglevel "ERROR"
printMessages

echo -e "These should print all messages except \"DEBUG\", \"INFO\", \"WARNING\", and \"FATAL\" to the file \"$logfile\"\n"
setfileloglevel "FATAL"
printMessages

cleanUp
