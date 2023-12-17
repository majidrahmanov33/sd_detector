#!/bin/bash

# This script is written by Fahmin Guliyev 
# It's a simple script which outputs all subdomains in Cisco's Website and their @IP as well
# The code might be too confusing for a task this simple as i'm not so good at shell so please 
# nevermind =(

wget -qO- https://www.cisco.com | grep -Eoi '<a [^>]+>' |  grep -Eo 'href="[^\"]+"' |  grep -Eo '(http|https)://[^/"]+' | grep -Ev '\b(http|https)://www' > domainnames.txt

figlet -c "CISCO SUBDOMAINS"
for i in `cat domainnames.txt`
do
	h=$(echo $i | cut -b 9-)
	host $h > hostsfull.txt
	echo "Subdomain : " $i 
	printf "IP Address(es) : ";cat hostsfull.txt | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'
	echo
done

rm domainnames.txt
rm hostsfull.txt
# | grep -Ev '\b(http|https)://www'
