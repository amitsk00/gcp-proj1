#!/usr/bin/bash

echo -e "test script, for trials\n"


i=0
while read line 
do
        # echo $line
        arr[$i]="$line"
        i=$((i+1))
done <  api.list
echo -e "\n\n"

echo "${arr[1]}"
echo "${arr[@]}"
arrLen=$(echo "${#arr[@]}")
echo $arrLen

j=$arrLen
echo $j

echo -e "exiting...\n"


while [ $j -gt 0 ]
do
    # echo $j
    k=$((j-1)) 
    j=$((j-1))  
    echo "${arr[$j]}"

done

