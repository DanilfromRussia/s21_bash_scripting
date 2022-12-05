#!/bin/bash
START=$(date +%s%N)
cd $1
echo "Total number of folders (including all nested ones) = "`find . -type d | wc -l`
echo '___________________________________________________________________________'
echo "TOP 5 folders of maximum size arranged in descending order (path and size):";echo
du -h `pwd` | sort -rh | head -5 | awk 'BEGIN{i=1} /.*/{printf "%d .% s\n",i,$0; i++}'
echo '___________________________________________________________________________'
echo "Total number of files = "`find . -type f | wc -l`
echo "Number of:"
echo "Configuration files (with the .conf extension) = "`find . -type f -name "*.conf" | wc -l`
echo "Executable files = "`find . -type f -executable | wc -l`
echo "Text files = "`find . -type f -readable | wc -l`
echo "Log files (with the extension .log) = "`find . -type f -name "*.log" | wc -l`
echo "Archive files = "`find . -type f -name "*.a" | wc -l`
echo "Symbolic links = "`find . -type l | wc -l`
echo '___________________________________________________________________________'
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):";echo
find `pwd` -xdev -type f -exec du -sh {} ';' | sort -rh | head -10 | awk 'BEGIN{i=1} /.*/{printf "%d .% s\n",i,$0; i++}'
echo '___________________________________________________________________________'
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):";echo
find `pwd` -xdev -type f -executable -exec du -sh {} ';' | sort -rh | head -10>file.txt
for (( i=1; i-1<`wc -l file.txt | awk '{print $1}'`; i++ ))
do
md5sum `cat file.txt | awk "NR==$i" | awk '{print $2}'` | awk '{print $1}'>>file2.txt
sed "s/$/ `cat file2.txt | awk "NR==$i"`/" file.txt | awk "NR==$i"
done
rm file2.txt
rm file.txt
echo '___________________________________________________________________________'
echo -n "Script execution time (in seconds) = "
END=$(date +%s%N)
echo $(bc<<<"scale=2;$((($END - $START)/1000000))/1000") sec
