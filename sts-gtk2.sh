#!/bin/bash
# Based on https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
# and my own boilerplate https://github.com/Szymon2603/auxiliary-scripts

# Main script description
MAIN_DESC="Run STS with GTK2"

# Description for help and invoke errors
PARAMETERS_DESC="Parameters description:\n\
				 -d|--dir - directory with STS\n\
				 -h|--help - help message\n"

export SWT_GTK3=0

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
	-d|--dir)
	DIR="$2"
	shift
	;;
    -h|--help)
    echo -e $MAIN_DESC
    echo -e $PARAMETERS_DESC
    exit 0
    ;;
    *)
    echo "Wrong parameter! [$1 $2]"
    echo -e $PARAMETERS_DESC
    exit 1
    ;;
esac

# Past argument or value
shift
done

set -e

# Run STS
if ! [ -z ${DIR+x} ]; then
	echo "Run from directory $DIR"
	$DIR/STS
else
	if ! [ -z ${STS_HOME+x} ]; then
		echo "Run from $STS_HOME directory"
		$STS_HOME/STS
	else
		echo "STS_HOME is unset! You have to pass directory via -d|--dir parameter!"
		exit 1
	fi
fi
