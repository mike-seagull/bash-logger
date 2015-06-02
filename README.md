# bash-logging
just a simple bash logger that logs to the screen and to a file

How to use it:

1. "source logging.sh" in your shell script
2. overwrite the "logfile" variable with the path to the logfile that you want to write to (it defaults to /var/log/"FILEBASENAME".log)
3. call setloglevel and pass it the log level (defaults to "DEBUG")
4. call the log functions

logs available:

debug <message>
info <message>
warning <message>
error <message>
fatal <message>

functions:

setloglevel <loglevel> 
Sets the log's level. The Log levels available are debug, info, warning, error, and fatal.

