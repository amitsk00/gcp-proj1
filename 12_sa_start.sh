#!/usr/bin/bash

echo -e "Creating Service Account"

(
while IFS="," read -r tF1 tF2 ; do
    SA="$(echo $tF1 |  sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')" 
    SADescr="$(echo $tF2 |  sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')" 
    # echo -e "~"$SA"~"$SADescr"~"

    ID=$(gcloud iam service-accounts list  --filter=EMAIL~$SA --format="value(EMAIL)") 
    if [[ -z $ID ]]; then        
        echo -e "creating service account "$SA
        gcloud iam service-accounts create ${SA} --display-name "$SADescr"
    else
        echo $SA" --> exist - will be skipped"
    fi

    
done < "./srvc_acct.list"
)
