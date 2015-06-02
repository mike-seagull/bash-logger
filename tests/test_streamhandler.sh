#!/bin/bash

source "../streamhandler.sh"

function printMessages() {
	debug "This is a debug message"
	info "This is an info message"
	warning "This is warning message"
	error "This is an error message"
	fatal "This is a fatal message"	
	echo ""
}


echo -e "These should print all messages to the console"
printMessages

echo -e "These should print all messages except \"DEBUG\" to the console"
setstreamloglevel "INFO"
printMessages

echo -e "These should print all messages except \"DEBUG\" and \"INFO\" to the console"
setstreamloglevel "WARNING"
printMessages

echo -e "These should print all messages except \"DEBUG\", \"INFO\", and \"WARNING\" to the console"
setstreamloglevel "ERROR"
printMessages

echo -e "These should print all messages except \"DEBUG\", \"INFO\", \"WARNING\", and \"FATAL\" to the console"
setstreamloglevel "FATAL"
printMessages
