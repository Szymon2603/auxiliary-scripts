#!/bin/bash
# Boilerplate script for bash

# Use -gt 1 to consume two arguments per pass in the loop (e.g. each
# argument has a corresponding value to go with it).
# Use -gt 0 to consume one or more arguments per pass in the loop (e.g.
# some arguments don't have a corresponding value to go with it such
# as in the --default example).
# note: if this is set to -gt 0 the /etc/hosts part is not recognized ( may be a bug )

# Based on https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash

# Main script description
MAIN_DESC="Bash boilerplate script"

# Description for help and invoke errors
PARAMETERS_DESC="Parameters description:"

# Section for global variables and default values for example:
# FORCE=false

# Loop for collecting parameters passed to the script from CLI
# When parameter is build from token and value you have to use shift to skip extra value
# -d|--dir)
#    DIR="$2"
#    shift
#    ;;
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
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

# Exit script on any error
set -e
