#!/bin/bash

<<comment
This is the shell script for nginx
Installation
comment

read -p "Enter Package :-" name

if which $name; then
	echo "$name service is already present. so we uninstall the $name"
	sudo apt purge $name -y > /dev/null
	sudo date
	echo "$name uninstall successfully"
else 
	echo "$name service not found. so we install the $name"
	echo "*************INSTALLING $name************"
	sudo apt-get install $name -y > /dev/null
	if systemctl list-units --type=service | grep -q "$name.service"; then
		sudo systemctl start $name
        	sudo systemctl restart $name
		echo "$name service started"
	fi
	sudo date
	echo "*************INSTALLED $name*************"
fi


