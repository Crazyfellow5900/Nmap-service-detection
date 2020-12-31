#!/bin/bash 

#this is basic scan for nmap service version detection,which scans all the 65535 ports#

#please make sure that if there is any firewall or IDS/IPS then the results will not be shown#

#you can simply scan this using command nmap -T3 -sV -p- -A<target ip>#

#here in some rare situations we find some errors like blocking  our pings so to rectify them i have just used -Pn #


if [ "$1" == ""]
then
	echo "ERROR"
	echo "Syntax: ./nmap.sh <target ip>"
	
else
	nmap -T4 -Pn -sV -p- -A -vv  $1 > base.txt;
#here we have just scan the target ip and the results of the scan was saved to base.txt#
	cat base.txt | grep "open" | cut -d " " -f 1 | tr -d "/tcp" | > results.txt;
#what we have done here is we will opened the base.txt file and seperated the open ports , cut the distance between them and seperated the /tcp from the results and saved the results to result.txt#	
	nmap -T4 -Pn -sV -p- A -vv $(cat results.txt) -A $1 > result.txt;
	rm base.txt
	rm results.txt
#here we removed the extra files base,results files and just kept the resultant file only 
fi
