#!/bin/bash

# Variables
TODAY=`date +%Y-%m-%d`

# Start backup
sudo cya keep name ${HOSTNAME}_${TODAY} archive

# Copy backup to remote
if [ -d "/mnt/backup/$HOSTNAME/cya" ]; then
	sudo cp -r /home/cya/archives/* /mnt/backup/$HOSTNAME/cya/
else
    sudo mkdir /mnt/backup/$HOSTNAME/cya
    sudo cp -r /home/cya/archives/* /mnt/backup/$HOSTNAME/cya/
fi
sudo rm -r /home/cya/archives/*