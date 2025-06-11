#!/usr/bin/bash

echo -e "Disabling API "

# for  SERVICE_NAME in $(cat ./api.list)
# do
#     echo  -e ">>>>>>>"  $SERVICE_NAME
#     gcloud services disable $SERVICE_NAME  --async 
# done

i=0
while read line 
do
    arr[$i]="$line"
    i=$((i+1))
done <  api.list
echo -e "\n\n"


arrLen=$(echo "${#arr[@]}")
j=$arrLen

while [ $j -gt 0 ]
do
    # echo $j
    k=$((j-1)) 
    j=$((j-1))  
    SERVICE_NAME="${arr[$j]}"
    # echo $SERVICE_NAME
    gcloud services disable $SERVICE_NAME 


done
