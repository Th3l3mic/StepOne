# StepOneRecon

A simple/basic bash script automating the first reconnaissance steps for CTFs
_______________________________
Usage: ./Step-One.sh target
_______________________________

The script will perform an Nmap scan, then if it finds an HTTP service, it will use Gobuster to find hidden directories, as well as Whatweb for identify web technologies. 
The last step is to use basic Nikto scanning. You can freely modify and improve this script. I hope it will be useful.

