FILENAME=`basename "$0"`
LOGFILE="/var/log/${FILENAME%.*}.log" # full path to the logfile

INFO () {
	# info log
	LOG "INFO:\t$1"
}
ERROR() {
	# error log
	LOG "ERROR:\t$1"
}


LOG(){
	# logs to screen and file
	msg=$1
	dt=$(date '+%m/%d/%Y %H:%M:%S.%s')
	echo -e "[$dt]$msg" >> $LOGFILE
}
