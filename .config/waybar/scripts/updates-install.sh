#!/bin/sh

clear

if ! updates_void=$(xbps-install -nu 2> /dev/null | sed -n "s/\([^ ]*\).*/\1/p" | wc -l ); then
    updates_void=0
fi

if ! updates_flat=$(flatpak remote-ls --updates 2> /dev/null | sed -n "s/\([^\s\t\n]*\).*/\1/p" | wc -l); then
    updates_flat=0
fi

updates=$((updates_void + updates_flat))
if [ "$updates" -eq 0 ]; then
    echo "There is nothing to do... Updating status and exiting..."
    sleep 3
    exit
fi

while true; do
    read -p "$updates packages needs to be installed ($updates_void xbps, $updates_flat flatpak). Do you want to update the system? (Yy/Nn): " yn
    case $yn in
        [Yy]* )
            echo ""
        break;;
        [Nn]* ) 
            exit;
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "-----------------------------------------------------"
echo "Updating the snapshot"
echo "-----------------------------------------------------"
echo ""
sleep 1

sudo mount /dev/mapper/lvmvoid-lvvoid /mnt
cd /mnt
if [ -d @-BACKUP ]; then
    dunstify -t 5000 "Delete backup @-BACKUP"
    sudo btrfs sub del @-BACKUP
fi
if [ -d @home-BACKUP ]; then
    dunstify -t 5000 "Delete backup @home-BACKUP"
    sudo btrfs sub del @home-BACKUP
fi

echo "-----------------------------------------------------"
echo "Start update"
echo "-----------------------------------------------------"
echo ""
sleep 1

dunstify -t 1000 "Create backup @-BACKUP"
sudo btrfs sub snap @ @-BACKUP
dunstify -t 1000 "Create backup @home-BACKUP"
sudo btrfs sub snap @home @home-BACKUP
cd /
sudo umount /mnt
dunstify -t 5000 "Updating XBPS packages..."
sudo xbps-install -Suvy 2> /dev/null
dunstify -t 5000 "Done"
dunstify -t 5000 "Updating flatpak packages..."
sudo flatpak update --noninteractive --assumeyes 2> /dev/null
dunstify -t 5000 "Done"

echo "-----------------------------------------------------"
echo "Done"
echo "-----------------------------------------------------"
echo ""
sleep 1
clear
neofetch
sleep 5
