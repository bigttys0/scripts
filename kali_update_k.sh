#!/bin/bash

cd
clear

tput setaf 3; tput bold; echo "[+] Updating Kali. Please wait."
apt update -y && apt dist-upgrade -y

sleep 1

tput setaf 2; tput bold; echo "[+] Kali is now up to date."

sleep 1

tput setaf 6; tput bold; echo "[+] Cleaning Kali. Please wait."
apt autoremove -y && apt autoclean -y && apt clean -y

sleep 1 

tput setaf 2; tput bold; echo "[+] Kali is now less dirty!"

sleep 1 

tput setaf 1; tput bold; 
echo "Process is complete, do you want to reboot right meow?"
select yn in "Yes" "No"; do
	case $yn in 
		[Yy]* ) /sbin/reboot; break;;
		[Nn]* ) ctrl_c() { kill %%; exit; }
			trap ctrl_c INT
			working &
			task 10
			kill -s SIGPIPE %%;
	esac

tput setaf 2; tput bold; echo "Fine. Carry on.";
cd; clear

done
