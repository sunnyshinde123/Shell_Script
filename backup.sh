#!/bin/bash

<<comment
This script take backup of any destination path given in arguments
./backup.sh /source /destination
./backup.sh /home/ubuntu/scripts /home/ubuntu/backup
comment

timestamp="$(date '+%Y-%M-%d_%H:%M:%S')"

function backup(){
	if ! [[ $# -gt 1 ]]; then
		echo "missing either source dir or destination dir"
		exit 1
	fi

	zip -r "${2}/${timestamp}_backup.zip" "$1"

	if [[ $? -eq 0 ]] ; then
		echo "backup ${timestamp}_backup.zip created successfully" 	
	fi
}

backup $1 $2
