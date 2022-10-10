#!/usr/bin/bash

echo -e "Setting up GCP project for psoft.amit GMAIL account"

gcloud config set account psoft.amit@gmail.com
echo "Y" | gcloud config set project proj-free-sept 
gcloud services enable compute.googleapis.com 
gcloud config set compute/region  us-central1
gcloud config set compute/zone  us-central1-a

# gcloud auth login
# gcloud auth application-default login --no-launch-browser

./11_api_start.sh
./12_sa_start.sh
./13_sa_roles.sh

cd  ./terra-main
