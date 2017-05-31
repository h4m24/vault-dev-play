#!/bin/bash
set -e
echo "######################################################################"
echo please run the following if you are using env variables
echo 'export VAULT_ADDR="http://127.0.0.1:8200"'
echo  VAULT_TOKEN for this env is 123
echo "######################################################################"

export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN='123'

sleep 2s
echo
echo
ls -1 secrets/ | while read SECFILE
  do
     curl \
         -H "X-Vault-Token: $VAULT_TOKEN" \
         -H "Content-Type: application/json" \
         -X POST \
         -d @secrets/"$SECFILE" \
         $VAULT_ADDR/v1/secret/$(echo $SECFILE| sed 's#.json##g') && \
         echo wrote "$SECFILE" secrets to secret/$(echo $SECFILE| sed 's#.json##g')

done
