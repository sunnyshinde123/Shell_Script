#!/bin/bash



function evenodd(){
	read -p "Enter any number" num

	if [[ $num  -eq 0 ]]; then
		echo "$num is zero $(date)"
	elif (( num % 2 == 0 )); then
		echo "$num is even"
	else
		echo "$num is odd"
	fi
}

evenodd
