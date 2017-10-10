#!/bin/bash

clear

echo -e "Kali Update Script"
echo "Press ENTER to continue, CTRL+C to abort."
read input

echo -e "\e[1;36m[+] Updating Kali. Please wait.\e[0m"
apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y
echo -e "Kali is now up to date.\n"

echo -e "\e[1;36m[+] Cleaning Kali. Please wait.\e[0m"

apt-get autoclean -y && apt-get clean -y
echo -e "\e[1;36m[+] Kali is now less dirty..."

# store the current dir
CUR_DIR=$(pwd)

# Let the person running the script know what's going on.
echo "\n\033[1mPulling in latest changes for all git repositories...\033[0m\n"

# Find all git repositories and update it to the master latest revision
for i in $(find . -name ".git" | cut -c 3-); do
    echo "";
    echo "\033[33m"+$i+"\033[0m";

    # We have to go to the .git parent directory to call the pull command
    cd "$i";
    cd ..;

    # finally pull
    git pull origin master;

    # lets get back to the CUR_DIR
    cd $CUR_DIR
done

echo "\n\033[32mComplete!\033[0m\n"
