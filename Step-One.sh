#!/bin/bash
printf "\n"
echo "        #######T#h#3#l#3#m#i#c################"
echo "        ###           * * *             ######"
echo "        ###  Step-One-Recon script      ######"
echo "        ###           * * *             ######"
echo "        ######################################"
printf "\n---------------------------------------------------------------------"
printf "\n[/] Results will be stored in recon.txt file in current directory [/]"
printf "\n---------------------------------------------------------------------"

if [ -z "$1" ]; then
	echo "[+] Usage: step-one.sh <target IP>"
	exit 1
fi

printf "\n[+] Starting Step-One-Recon script [+]"
printf "\n"
printf "\n[+]----------------NMAP--------------------------------------\n\n" > recon
printf "\n[*] Running nmap scan..."

nmap -A -T4 -p- $1 |tail -n +5 |head -n -3 >> recon


if grep -q "http" recon; then
	printf "\n[*]----------GOBUSTER-------------\n\n" >> recon
	printf "\n[*] Running Gobuster and Whatweb... "
	gobuster dir -u $1 -w /usr/share/wordlists/dirb/common.txt -z >> recon
	
	printf "\n[*]-----------WHATWEB-----------------------\n\n" >> recon
	
	whatweb $1 -v >> recon
	
fi

printf "\n[?] Would You like to run Nikto? "
read -p "y/n " answer

if [ $answer != "y" ]; then
	echo "[!] Bye!"
	cat recon
	exit 0
fi

echo "[*] Running Nikto... "
printf "\n[*]-----------NIKTO-----------------------\n\n" >> recon
nikto -host $1 >> recon


cat recon
