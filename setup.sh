#!/bin/bash
# Setup scripts directories if they do not exist
clear
[ ! -d /scripts ] && mkdir -p /scripts
[ ! -d /scripts/cya-backup ] && mkdir -p /scripts/cya-backup

sudo cp -r ./files/* /scripts/cya-backup/

# Install requirements
clear
sudo apt-get install -y nfs-common
sudo apt-get install -y cifs-utils

# Install CYA snapshot utility
clear
git clone https://github.com/cleverwise/cya.git /tmp/cya
sudo cp /tmp/cya/cya /usr/local/bin

# Create SMB mount
clear
if [ -d "/mnt/backup" ]; then
	echo "**** Your backup is already setup for this server ****"
else
	sudo mkdir /mnt/backup
	read -p "Enter server IP/hostname: " server
	read -p "Enter share name: " share
	read -p "Enter username: " username
	read -s -p "Enter password: " password
	sudo mount -t cifs -o user=$username,password=$password //$server/$share /mnt/backup

	# Setup cron job
	sudo cp ./files/backup.sh /etc/cron.weekly/cya-backup.sh
	sudo chmod +x /etc/cron.weekly/cya-backup.sh
fi

[ ! -d /mnt/backup/$HOSTNAME ] && mkdir -p /mnt/backup/$HOSTNAME