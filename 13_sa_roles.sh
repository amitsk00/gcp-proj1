#!/usr/bin/bash

echo -e "Role Binding started ..."

myGcpProj=proj-free-sept 
saSuffix=".iam.gserviceaccount.com"


saPrefix=sa-gce
saID=$saPrefix"@"$myGcpProj$saSuffix

gcloud projects add-iam-policy-binding  $myGcpProj \
    --member='serviceAccount:'$saID  \
    --role='roles/compute.instanceAdmin'




gcloud projects add-iam-policy-binding  $myGcpProj \
    --member='serviceAccount:'$saID  \
    --role='roles/compute.networkAdmin'


saPrefix=sa-image
saID=$saPrefix"@"$myGcpProj$saSuffix

gcloud projects add-iam-policy-binding  $myGcpProj \
    --member='serviceAccount:'$saID  \
    --role='roles/compute.instanceAdmin'        


gcloud projects add-iam-policy-binding  $myGcpProj \
    --member='serviceAccount:'$saID  \
    --role='roles/compute.osAdminLogin'  


gcloud projects add-iam-policy-binding  $myGcpProj \
    --member='serviceAccount:'$saID  \
    --role='roles/compute.imageUser'  




