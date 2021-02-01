#/bin/bash

# Backup OS to Ext. HDD

TIME=$(date +%H:%M:%S)
DATE=$(date +%b-%d-%y)
SRCDIR=/home/gh0st/
DESTUSB=/media/gh0st/backupdr/os_backup

echo $DATE
echo "Starting Backup...."
sudo rsync -av --delete $SRCDIR $DESTUSB
echo "Backup Completed at $TIME"
exit

