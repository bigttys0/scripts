#!/bin/bash

cd
clear

tput setaf 3; tput bold; echo "[+] Updating Kali. Please wait."
apt update -y && apt dist-upgrade -y

sleep 1

tput setaf 3; tput bold; echo "[+] Kali is now up to date."

sleep 1

tput setaf 6; tput bold; echo "[+] Cleaning Kali. Please wait."
apt autoremove -y && apt autoclean -y && apt clean -y
tput setaf 3; tput bold;

sleep 1 

tput setaf 2; tput bold; echo "[+] Kali is now less dirty!"

sleep 1 

tput setaf 1; tput bold; echo 
read -p "Process is complete, do you want to reboot right meow? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    /sbin/reboot
fi

clear
cd
