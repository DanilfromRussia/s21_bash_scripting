#!/bin/bash
param=$@
if [ $param ]; then
	temp=$(echo $param | tr -cd [:digit:])
	if [ $temp ]; then
		echo "err"
	else
		echo $param
	fi
	
else
	echo "err"
fi
