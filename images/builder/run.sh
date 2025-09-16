#!/bin/bash

TOKEN_FILE=/run/secrets/BUILDER_TOKEN
if [ ! -f "$TOKEN_FILE" ]
then
	echo "Could not fin token file '$TOKEN_FILE'"
	exit 1
fi

ls -la /run/secrets

export GITEA_WEBHOOK_AUTH=$(cat "$TOKEN_FILE")


ls
git pull
./hook.py
