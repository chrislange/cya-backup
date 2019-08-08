#!/bin/bash

sudo umount /mnt/backup
sudo rm -r /mnt/backup
sudo rm -r /usr/local/bin/cya
sudo rm -r /home/cya
sudo rm /etc/cron.weekly/cya-backup
clear

echo "CYA Backup Uninstalled"