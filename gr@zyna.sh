#!/bin/bash
#set -xe
#gr@zyna.sh
# 'GR@AYZNA' v1.0
# (c) 2018
# by m0ses

dmn=$1
ip=$1
DIR=/tmp/test1.txt
x=0
clear

# resize terminal window
resize -s 25 91 > /dev/null

# colors
NC='\033[0m'
RED='\033[0;31m'	#TEXT
CYAN='\033[0;36m'
GREEN='\033[0;32m'
lGRAY='\033[1;37m'

REDb='\033[1;31m'	#TEXT - BOLD
CYANb='\033[1;36m'
GREENb='\033[1;32m'
lGRAYb='\033[1;37m'
WHITEback='\e[47m'		#BACKGROUNDS

function banner(){
	echo -e "${CYAN}    __________  ___ _______  ___   _____  ${RED}     _         __            __   _             "
	echo -e "${CYAN}   / ____/ __ \/   /__  /\ \/ / | / /   | ${RED}    (_)____   / /___  ____  / /__(_)___  ____ _ "
	echo -e "${CYAN}  / / __/ /_/ / /| | / /  \  /  |/ / /| | ${RED}   / / ___/  / / __ \/ __ \/ //_/ / __ \/ __  / "
	echo -e "${CYAN} / /_/ / _  _/ ___ |/ /__ / / /|  / ___ | ${RED}  / (__  )  / / /_/ / /_/ /  < / / / / / /_/ /  "
	echo -e "${CYAN} \____/_/ |_/_/  |_/____//_/_/ |_/_/  |_| ${RED} /_/____/  /_/\____/\____/_/|_/_/_/ /_/\__  /   "
	echo -e "${CYAN}                                          ${RED}                                      /____/    "
	echo -e "${NC} ${RED}GR@ZYNA 2018 - v1.1 		                                             ${CYAN}by m0ses                                                          "
	echo -e "${NC}                                                                                          "
}
# "Moses also heard voices"
# by m0ses

function fetch(){
        curl -s https://tools.keycdn.com/geo.json?host={$ip} | \
	sed -e 's/[{}]/''/g' | awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}' | \
	grep 'host\|ip\|rdns\|isp\|country_name\|country_code\|city\|postal_code\|latitude\|longitude\|timezone\|datetime' | \
	sed -e 's/"/''/g' | sed -e 's/:/= /g'> $DIR 
cat $DIR
#rm $DIR
}

function fetch2(){
        curl -s https://tools.keycdn.com/geo.json?host={$dmn} | \
	sed -e 's/[{}]/''/g' | awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}' | \
	grep 'host\|ip\|rdns\|isp\|country_name\|country_code\|city\|postal_code\|latitude\|longitude\|timezone\|datetime' | \
	sed -e 's/"/''/g' | sed -e 's/:/= /g'> $DIR 
cat $DIR
#rm $DIR
}

function menu(){
	
	while [ $x = 0 ]
	do
		echo -e "${CYANb}	[*] Choose an option: "
		echo
		echo -e "		1. GR@ZYNA"
		echo -e "		99. EXIT"
		echo
		echo -e "${REDb}$ I'm choosing... (1/99)"
	
		read answer

		case "$answer" in
			1)
			x=1
			;;
			99)
			x=2
			sleep 1
			echo
			echo -e "${CYAN}Thank you for using GR@ZYNA. BYE ;)"
			echo
			sleep 1
			exit
			;;
		esac

	done
	
	while [ $x = 1 ]
	do
		echo
		echo -e "${lGRAY}[*]==============================[*]"
		echo
		echo -e "${CYANb}	[*] Choose an option: "
		echo
		echo -e "		1. Domain name"
		echo -e "		2. IP adress"
		echo -e "		99. EXIT"
		echo
		echo -e "${REDb}$ I'm choosing... (1/2/99)"
	
		read answer2

		case "$answer2" in
			1)
			echo
			echo -e "${RED}Domain name: "
			read dmn
			echo -e "${lGRAYb}"
			fetch2;
			echo -e "${RED}"
			x=1
			;;
			2)
			echo
			echo -e "${RED}IP adress: "
			read ip
			echo -e "${lGRAYb}"
			fetch;
			echo -e "${RED}"
			x=1
			;;
			99)
			x=2
			sleep 1
			echo
			menu;
			;;
		esac

	done
	
	while [ $x = 2 ]
	do
		echo -e "${lGRAYb}Thank you for using ${RED}gr@zyna ${lGRAYb};* !!!"
		echo
		exit
	done
}

banner;
menu;
