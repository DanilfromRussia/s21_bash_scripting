#!/bin/bash
#Проверяющему: Выдайте всем скриптам execute права командой "chmod +x имя.sh"
echo -n "HOSTNAME=";hostname
myTimedatectl=`timedatectl | grep 'Time zone' | tr -d ' ' | grep -o '^[^(]*'`
dateOutput=`timedatectl | grep 'Time zone' | tr -cd [:digit:]'+-'`
echo -n "TIMEZONE=";echo -n ${myTimedatectl:9};echo -n ' UTC';echo $dateOutput
echo -n "USER=";whoami
#Проверяющему: Выполните "sudo apt install lsb-core", иначе ошибка
myOs=`lsb_release -a | grep 'Description'`
echo -n "OS=";echo ${myOs:12}
echo -n "DATE=";echo `date` | awk '{print $2,$3,$4,$5}'
echo -n "UPTIME=";echo `uptime -p` | awk '{print $2,$3,$4,$5}'
echo -n "UPTIME_SEC=";cat /proc/uptime | awk '{print $1}'

echo -n "IP="
myIP=`ip a | grep global`
if [ "$myIP" ]; then
	echo `ip a | grep global` | awk '{print $2}'
	echo -n "MASK="
	myMask=`ifconfig | grep netmask | awk '(NR==2)'`
	echo $myMask | awk '{print $4}'
else
	echo "127.0.0.1/8"
	echo -n "MASK=255.0.0.0"
fi
echo -n "GATEWAY=";ip route | grep default | awk '{print $3}'
totalRamKb=`vmstat -s | awk '(NR==1)' | awk '{print $1}'`
echo -n "RAM_TOTAL=";echo $(bc<<<"scale=3;$totalRamKb/1048576") GB
usedRamKb=`vmstat -s | awk '(NR==2)' | awk '{print $1}'`
echo -n "RAM_USED=";echo $(bc<<<"scale=3;$usedRamKb/1048576") GB
freeRamKb=`vmstat -s | awk '(NR==5)' | awk '{print $1}'`
echo -n "RAM_FREE=";echo $(bc<<<"scale=3;$freeRamKb/1048576") GB
totalRootSize=`df -k / | awk '(NR==2)' | awk '{print $2}'`
echo -n "SPACE_ROOT=";echo $(bc<<<"scale=3;$totalRootSize/1048576") GB
usedRootSpace=`df -k / | awk '(NR==2)' | awk '{print $3}'`
echo -n "SPACE_ROOT_USED=";echo $(bc<<<"scale=2;$usedRootSpace/1048576") GB
let freeRootSpace=`df -k / | awk '(NR==2)' | awk '{print $4}'`
echo -n "SPACE_ROOT_FREE=";echo $(bc<<<"scale=2;$freeRootSpace/1048576") GB
echo "_____________________________________________"
echo -n "Сохраним данные в файл текущей директории? "[Y/N]"";read yourStdin
if [[ $yourStdin == 'y' || $yourStdin == 'Y' ]]; then
	fileName=$(date | sed 's/ /_/g')
	./basic.sh > "$fileName"
else
	exit 0
fi
