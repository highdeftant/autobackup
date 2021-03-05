#!/bin/bash

# Auto-Backup OS on schedule

DATE=$(date +%b-%d-%y)
TIME=$(date +%H:%M:%S)
SRCDIR=/home/gh0st/
DESTUSB=/media/gh0st/backupdr/os_backup

function backupos() {
	echo $DATE
	echo "Starting Backup...."
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
sleep 3
echo "-------------------------"
echo "-------------------------"
echo "-------------------------"
updateOS
exit
