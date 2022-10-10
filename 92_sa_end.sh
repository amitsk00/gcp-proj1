#!/usr/bin/bash

echo -e "Clearing of Service Account"

(
while IFS="," read -r tF1 tF2 ; do
    SA="$(echo $tF1 |  sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')" 
    SADescr="$(echo $tF2 |  sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')" 
    # echo -e "~"$SA"~"$SADescr"~"

    ID=$(gcloud iam service-accounts list  --filter=EMAIL~$SA --format="value(EMAIL)") 
    if [[ -z $ID ]]; then        
        echo -e "Service Account "$SA " doesn't exist"

    else
        echo $SA "~" $ID " --> will be deleted"
        gcloud iam service-accounts delete $ID -q
    fi

    
done < "./srvc_acct.list"
)
