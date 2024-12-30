#!/bin/bash

<<comment
This is the User Management Script
comment

function giveUsername(){
	read -p "Enter Username: " username

	if [[ ! $username ]]; then
		echo "username can't be empty. please provide the username"
		giveUsername
	else
		createUser
	fi
}

function createUser(){

	if  grep -q $username /etc/passwd ; then
		echo "Username alredy exists. please try again"
	        giveUsername
	else
		sudo useradd -m $username
		echo "user created succssfully. please provide password for user"
		sudo passwd $username
		echo "user password created succssfully"
	fi
}

giveUsername
createUser
