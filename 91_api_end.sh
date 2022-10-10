#!/usr/bin/bash

echo -e "Disabling API "

for  SERVICE_NAME in $(cat ./api.list)
do
    echo  -e ">>>>>>>"  $SERVICE_NAME
    gcloud services disable $SERVICE_NAME  --async 
done
