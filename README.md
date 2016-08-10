# bash-logging
just a simple bash logger that logs to the screen (streamhandler) or to a file (filehandler)

How to use it:

1. "source filehandler.sh" in your shell script to log to a file and "source streamhandler.sh" to log to the console
2. overwrite the "logfile" variable with the path to the logfile that you want to write to (it defaults to /var/log/"FILEBASENAME".log)
3. call the log functions

logs available:

- debug \<message\>
- info \<message\>
- warning \<message\>
- error \<message\>
- fatal \<message\>
