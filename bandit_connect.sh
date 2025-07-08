#!/bin/bash

greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

password="What is the password for this level of Bandit?"
nivel="Hello $(whoami), enter the Bandit level"

echo -e "\n${yellowColour}[+]${endColour}${purpleColour} ${nivel}${endColour}"
read -p "Level: " lvl
echo -e "\n${yellowColour}[+]${endColour}${purpleColour} ${password}${endColour}"
read -sp "Password: " pass
echo

if [[ -z "$lvl" || -z "$pass" ]]; then
  echo -e "\n${redColour}[!] Level or password not provided.${endColour}"
  exit 1
fi

echo -e "\n${yellowColour}[+]${endColour}${blueColour} Connecting to Bandit ${lvl}...${endColour}"

sshpass -p "${pass}" ssh -t bandit${lvl}@bandit.labs.overthewire.org -p 2220 'export TERM=xterm; exec bash -l'

echo -e "\n${redColour}Thanks for playing, $(whoami)${endColour}\n"