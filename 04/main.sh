#!/bin/bash
BackgrColor1='6' #default value black
TextColor1='1' #default value white
BackgrColor2='2' #default value red
TextColor2='4' #default value blue

sedVariable=''

colorTranscription() {
	if [[ $1 -eq 1 ]]; then
		sedVariable='white'
	elif [[ $1 -eq 2 ]]; then
		sedVariable='red'
	elif [[ $1 -eq 3 ]]; then
		sedVariable='green'
	elif [[ $1 -eq 4 ]]; then
		sedVariable='blue'
	elif [[ $1 -eq 5 ]]; then
		sedVariable='violet'
	else
		sedVariable='black'
	fi
}

# ["white", "red", "green", "blue", "violet", "black"]

#------------------------------------------
if [[ `cat configure.txt | grep 'column1_background='` ]]; then
	BackgrColor1=`cat configure.txt | grep 'column1_background=' | sed 's/.*=//'`
	colorTranscription $BackgrColor1
	sed -ie "s/^column1_background=.*$/& (${sedVariable})/g" configure.txt
else
	let "BackgrColor1 *= 10"
fi

if [[ `cat configure.txt | grep 'column1_font_color='` ]]; then
	TextColor1=`cat configure.txt | grep 'column1_font_color=' | sed 's/.*=//'`
	colorTranscription $TextColor1
	sed -ie "s/^column1_font_color=.*$/& (${sedVariable})/g" configure.txt
else
	let "TextColor1 *= 10"
fi

if [[ `cat configure.txt | grep 'column2_background='` ]]; then
	BackgrColor2=`cat configure.txt | grep 'column2_background=' | sed 's/.*=//'`
	colorTranscription $BackgrColor2
	sed -ie "s/^column2_background=.*$/& (${sedVariable})/g" configure.txt
else
	let "BackgrColor2 *= 10"
fi

if [[ `cat configure.txt | grep 'column2_font_color='` ]]; then
	TextColor2=`cat configure.txt | grep 'column2_font_color=' | sed 's/.*=//'`
	colorTranscription $TextColor2
	sed -ie "s/^column2_font_color=.*$/& (${sedVariable})/g" configure.txt
else
	let "TextColor2 *= 10"
fi

if [[ $BackgrColor1 -eq 1 ]]; then
BackgrColor1='\033[107m'
elif [[ $BackgrColor1 -eq 2 ]]; then
BackgrColor1='\033[101m'
elif [[ $BackgrColor1 -eq 3 ]]; then
BackgrColor1='\033[42m'
elif [[ $BackgrColor1 -eq 4 ]]; then
BackgrColor1='\033[104m'
elif [[ $BackgrColor1 -eq 5 ]]; then
BackgrColor1='\033[105m'
elif [[ $BackgrColor1 -eq 6 ]]; then
BackgrColor1='\033[40m'
else
	BackgrColor1='\033[40m' #default
	echo "column_1_background=default (black)">>configure.txt
fi
#------------------------------------------	
if [[ $TextColor1 -eq 1 ]]; then
TextColor1='\033[97m'
elif [[ $TextColor1 -eq 2 ]]; then
TextColor1='\033[91m'
elif [[ $TextColor1 -eq 3 ]]; then
TextColor1='\033[92m'
elif [[ $TextColor1 -eq 4 ]]; then
TextColor1='\033[94m'
elif [[ $TextColor1 -eq 5 ]]; then
TextColor1='\033[95m'
elif [[ $TextColor1 -eq 6 ]]; then
TextColor1='\033[30m'
else
	TextColor1='\033[97m' #default
	echo "column_1_font_color=default (white)">>configure.txt
fi
#------------------------------------------	
if [[ $BackgrColor2 -eq 1 ]]; then
BackgrColor2='\033[107m'
elif [[ $BackgrColor2 -eq 2 ]]; then
BackgrColor2='\033[101m'
elif [[ $BackgrColor2 -eq 3 ]]; then
BackgrColor2='\033[42m'
elif [[ $BackgrColor2 -eq 4 ]]; then
BackgrColor2='\033[104m'
elif [[ $BackgrColor2 -eq 5 ]]; then
BackgrColor2='\033[105m'
elif [[ $BackgrColor2 -eq 6 ]]; then
BackgrColor2='\033[40m'
else
	BackgrColor2='\033[101m' #default
	echo "column_2_background=default (red)">>configure.txt
fi
#------------------------------------------
if [[ $TextColor2 -eq 1 ]]; then
TextColor2='\033[97m'
elif [[ $TextColor2 -eq 2 ]]; then
TextColor2='\033[91m'
elif [[ $TextColor2 -eq 3 ]]; then
TextColor2='\033[92m'
elif [[ $TextColor2 -eq 4 ]]; then
TextColor2='\033[94m'
elif [[ $TextColor2 -eq 5 ]]; then
TextColor2='\033[95m'
elif [[ $TextColor2 -eq 6 ]]; then
TextColor2='\033[30m'
else
	TextColor2='\033[94m' #default
	echo "column_2_font_color=default (blue)">>configure.txt
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

echo
cd ../04
cat configure.txt | sed 's/_/ /g' | sed 's/c/C/g'
rm -rf configure.txte







