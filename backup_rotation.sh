#!/bin/bash


<<comment
This is the backup rotation shell script
here we take 5 days rotation backup files
comment

function displayUsage(){
	echo "Usage:- ./backup_rotation source(which files to take backup) destination(where to store the backup files)"
	return 0
}

if [[ ! $# -gt 1 ]]; then
	displayUsage
	echo  "backup not created. Please follow the above instructions"
fi

timestamp="$(date '+%Y-%M-%d_%H:%M:%S')"
source_dir="$1"
dest_dir="$2"

function takeBackup(){

	zip -r "${dest_dir}/${timestamp}_backup.zip" "${source_dir}" > /dev/null
	
	if [[ $? -eq 0 ]]; then
		echo "Backup Created Successfully for this ${timestamp}"
		return 0
	fi
	echo "Backup not created please check the source_dir or destination dir exists or not"
}

function backup_rotation(){
	backup=($(ls -t "${dest_dir}/"*"_backup.zip"))
	
	if [[ ${#backup[@]} -gt 5 ]]; then
		backups=("${backup[@]:5}")
		for backupfile in ${backups[@]}; 
		do
			rm -rf $backupfile
		done

		echo "backup rotation performed successfully"
	else
		echo "Sorry rotation can't be performed. dest dir ${dest_dir} doesn't contain more than 5 files"	
	fi


}


takeBackup
backup_rotation
