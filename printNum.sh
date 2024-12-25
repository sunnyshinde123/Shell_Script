#!/bin/bash

<<comment

Print Number from 0 to n by using for loop

comment

function printNum(){
	read -p "Enter number" num

	if ! [[ $num =~ ^[0-9]+$ ]]; then
		echo "Error: Please enter a valid positive number."
		return 1
	fi

	for(( i=0; i<=num; i++))
	do
		echo "$i"
	done
}

printNum
