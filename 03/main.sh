#!/bin/bash

if [[ ! $4 ]] || [[ $5 ]]; then
	echo "Please put 4 arguments and try again"
elif [[ $1 == $2 || $3 == $4 ]]; then
	echo "Please delete same arguments and try again"
elif [[ ! ($1 =~ ^[0-6]$) ]] || [[ ! ($2 =~ ^[0-6]$) ]] || [[ ! ($3 =~ ^[0-6]$) ]] || [[ ! ($4 =~ ^[0-6]$) ]]; then
	echo "Please use only numbers from 1 to 6"
else
	#[ 1 - white, 2 - red, 3 - green, 4 - blue, 5 - purple, 6 - black ]
	BackgrColor1=''
	TextColor1=''
	BackgrColor2=''
	TextColor2=''
#------------------------------------------
	if [[ $1 -eq 1 ]]; then
		BackgrColor1='\033[107m'
	elif [[ $1 -eq 2 ]]; then
		BackgrColor1='\033[101m'
	elif [[ $1 -eq 3 ]]; then
		BackgrColor1='\033[42m'
	elif [[ $1 -eq 4 ]]; then
		BackgrColor1='\033[104m'
	elif [[ $1 -eq 5 ]]; then
		BackgrColor1='\033[105m'
	else
		BackgrColor1='\033[40m'
	fi
#------------------------------------------	
	if [[ $2 -eq 1 ]]; then
		TextColor1='\033[97m'
	elif [[ $2 -eq 2 ]]; then
		TextColor1='\033[91m'
	elif [[ $2 -eq 3 ]]; then
		TextColor1='\033[92m'
	elif [[ $2 -eq 4 ]]; then
		TextColor1='\033[94m'
	elif [[ $2 -eq 5 ]]; then
		TextColor1='\033[95m'
	else
		TextColor1='\033[30m'
	fi
#------------------------------------------	
	if [[ $3 -eq 1 ]]; then
		BackgrColor2='\033[107m'
	elif [[ $3 -eq 2 ]]; then
		BackgrColor2='\033[101m'
	elif [[ $3 -eq 3 ]]; then
		BackgrColor2='\033[42m'
	elif [[ $3 -eq 4 ]]; then
		BackgrColor2='\033[104m'
	elif [[ $3 -eq 5 ]]; then
		BackgrColor2='\033[105m'
	else
		BackgrColor2='\033[40m'
	fi
#------------------------------------------
	if [[ $4 -eq 1 ]]; then
		TextColor2='\033[97m'
	elif [[ $4 -eq 2 ]]; then
		TextColor2='\033[91m'
	elif [[ $4 -eq 3 ]]; then
		TextColor2='\033[92m'
	elif [[ $4 -eq 4 ]]; then
		TextColor2='\033[94m'
	elif [[ $4 -eq 5 ]]; then
		TextColor2='\033[95m'
	else
		TextColor2='\033[30m'
	fi
#------------------------------------------
	cd ../02
	echo -e -n "$BackgrColor1$TextColor1`./basic.sh | awk '(NR==1)' | grep -o '^[^=]*'`\033[0m="
	echo -e "$BackgrColor2$TextColor2`./basic.sh | awk '(NR==1)' | sed 's/.*=//g'`\033[0m"
	echo -e -n "$BackgrColor1$TextColor1`./basic.sh | awk '(NR==2)' | grep -o '^[^=]*'`\033[0m="
	echo -e "$BackgrColor2$TextColor2`./basic.sh | awk '(NR==2)' | sed 's/.*=//g'`\033[0m"
	echo -e -n "$BackgrColor1$TextColor1`./basic.sh | awk '(NR==3)' | grep -o '^[^=]*'`\033[0m="
	echo -e "$BackgrColor2$TextColor2`./basic.sh | awk '(NR==3)' | sed 's/.*=//g'`\033[0m"
	echo -e -n "$BackgrColor1$TextColor1`./basic.sh | awk '(NR==4)' | grep -o '^[^=]*'`\033[0m="
	echo -e "$BackgrColor2$TextColor2`./basic.sh | awk '(NR==4)' | sed 's/.*=//g'`\033[0m"
	echo -e -n "$BackgrColor1$TextColor1`./basic.sh | awk '(NR==5)' | grep -o '^[^=]*'`\033[0m="
	echo -e "$BackgrColor2$TextColor2`./basic.sh | awk '(NR==5)' | sed 's/.*=//g'`\033[0m"
	echo -e -n "$BackgrColor1$TextColor1`./basic.sh | awk '(NR==6)' | grep -o '^[^=]*'`\033[0m="
	echo -e "$BackgrColor2$TextColor2`./basic.sh | awk '(NR==6)' | sed 's/.*=//g'`\033[0m"
	echo -e -n "$BackgrColor1$TextColor1`./basic.sh | awk '(NR==7)' | grep -o '^[^=]*'`\033[0m="
	echo -e "$BackgrColor2$TextColor2`./basic.sh | awk '(NR==7)' | sed 's/.*=//g'`\033[0m"
	echo -e -n "$BackgrColor1$TextColor1`./basic.sh | awk '(NR==8)' | grep -o '^[^=]*'`\033[0m="
	echo -e "$BackgrColor2$TextColor2`./basic.sh | awk '(NR==8)' | sed 's/.*=//g'`\033[0m"
	echo -e -n "$BackgrColor1$TextColor1`./basic.sh | awk '(NR==9)' | grep -o '^[^=]*'`\033[0m="
	echo -e "$BackgrColor2$TextColor2`./basic.sh | awk '(NR==9)' | sed 's/.*=//g'`\033[0m"
	echo -e -n "$BackgrColor1$TextColor1`./basic.sh | awk '(NR==10)' | grep -o '^[^=]*'`\033[0m="
	echo -e "$BackgrColor2$TextColor2`./basic.sh | awk '(NR==10)' | sed 's/.*=//g'`\033[0m"
	echo -e -n "$BackgrColor1$TextColor1`./basic.sh | awk '(NR==11)' | grep -o '^[^=]*'`\033[0m="
	echo -e "$BackgrColor2$TextColor2`./basic.sh | awk '(NR==11)' | sed 's/.*=//g'`\033[0m"
	echo -e -n "$BackgrColor1$TextColor1`./basic.sh | awk '(NR==12)' | grep -o '^[^=]*'`\033[0m="
	echo -e "$BackgrColor2$TextColor2`./basic.sh | awk '(NR==12)' | sed 's/.*=//g'`\033[0m"
	echo -e -n "$BackgrColor1$TextColor1`./basic.sh | awk '(NR==13)' | grep -o '^[^=]*'`\033[0m="
	echo -e "$BackgrColor2$TextColor2`./basic.sh | awk '(NR==13)' | sed 's/.*=//g'`\033[0m"
	echo -e -n "$BackgrColor1$TextColor1`./basic.sh | awk '(NR==14)' | grep -o '^[^=]*'`\033[0m="
	echo -e "$BackgrColor2$TextColor2`./basic.sh | awk '(NR==14)' | sed 's/.*=//g'`\033[0m"
	echo -e -n "$BackgrColor1$TextColor1`./basic.sh | awk '(NR==15)' | grep -o '^[^=]*'`\033[0m="
	echo -e "$BackgrColor2$TextColor2`./basic.sh | awk '(NR==15)' | sed 's/.*=//g'`\033[0m"
	echo -e -n "$BackgrColor1$TextColor1`./basic.sh | awk '(NR==16)' | grep -o '^[^=]*'`\033[0m="
	echo -e "$BackgrColor2$TextColor2`./basic.sh | awk '(NR==16)' | sed 's/.*=//g'`\033[0m"
fi

