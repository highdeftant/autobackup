#!/bin/bash

# Auto-Backup OS on schedule

DATE=$(date +%b-%d-%y)
TIME=$(date +%H:%M:%S)
SRCDIR=/home/$USER/
DESTUSB=/media/$USER/backupdr/os_backup

function restoreos(){
	DESTDR=/$HOME/$USER/
	SRCDR=/media/$USER/*/*
	echo "Starting Restoration...."
	sudo rsync -av $SRCDR $DESTDR
}



function backupos() {
	echo $DATE
	echo "Starting Backup...."
	rm -r .cache/mozilla/*
	sudo rsync -av --delete $SRCDIR $DESTUSB
	echo "Backup Completed at $TIME"
}

function updateOS() {
	echo $DATE
       	echo $TIME
 	echo "Starting Update"
 	sudo apt update -y
 	sudo apt upgrade -y
 	sudo apt dist-upgrade -y
	# Now Clean and Remove
 	sudo apt autoclean -y
 	sudo apt autoremove -y
 	echo "Update Complete"
 	echo "Completed at $TIME"
}


backupos
echo "-------------------------"
echo "-------------------------"
echo "-------------------------"
updateOS
exit
