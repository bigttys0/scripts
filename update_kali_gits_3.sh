#!/bin/bash

clear
cd

tput setaf 3; tput bold; echo -e "*****Kali & Git Update Script*****"
echo "Press ENTER to continue, CTRL+C to abort."
read input

tput setaf 7; tput bold; echo "[+] Updating Kali. Please wait."
apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y

sleep 1
tput setaf 2; tput bold; echo "[+] Kali is now up to date."

sleep 1
tput setaf 6; tput bold; echo "[+] Cleaning Kali. Please wait."
apt-get autoclean -y && apt-get clean -y
sleep 1 
tput setaf 6; tput bold; echo "[+] Kali is now less dirty!"
sleep 1

# store the current dir
CUR_DIR=$(pwd)

# Let the person running the script know what's going on.
tput setaf 3; tput bold; echo "[+] Pulling in latest changes for all git repositories..."
sleep 1

# Find all git repositories and update it to the master latest revision
for i in $(find . -name "*.git" | cut -c 3- | sort -d); do
    tput setaf 4; tput bold; echo "$i"

    # We have to go to the .git parent directory to call the pull command
    cd "$i";
    cd ..;

    # finally pull
    git pull origin master

    # lets get back to the CUR_DIR
    cd $CUR_DIR

done

clear
cd

tput setaf 5; tput bold; echo "Gitting the latest forked projects"
cd CloneGits
python clonegits.py --user bigttys0 --nopull --dest /root/gits

tput setaf 3; tput bold; echo "*****Complete!*****"
