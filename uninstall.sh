#!/bin/bash

sudo umount /mnt/backup
sudo rm -r /mnt/backup
sudo rm -r /usr/local/bin/cya
sudo rm -r /home/cya
sudo rm -r /scripts/cya-backup
sudo rm /etc/cron*/cya-backup.sh
clear

echo
echo "CYA Backup Uninstalled"
echo
