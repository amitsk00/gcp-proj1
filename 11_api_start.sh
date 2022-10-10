#!/usr/bin/bash

echo -e "Starting API "

for  SERVICE_NAME in $(cat ./api.list)
do
    echo  -e ">>>>>>>"  $SERVICE_NAME
    gcloud services enable $SERVICE_NAME
done

