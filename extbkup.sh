#/bin/bash

# Backup OS to Ext. HDD

TIME=$(date +%H:%M)
DATE=$(date +%b-%d-%y)
SRCDIR=/home/gh0st/
DESTUSB=/media/gh0st/backupdr/os_backup


echo "|  Backing Up OS..  |"
echo "|" $DATE "@" $TIME "|"
sudo rm -r /.cache/mozilla/*
sudo rsync -av --delete $SRCDIR $DESTUSB
echo "Backup Completed at $TIME"
exit

