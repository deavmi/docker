#!/bin/bash

# Bring in secret
TOKEN_FILE=/run/secrets/BUILDER_TOKEN
if [ ! -f "$TOKEN_FILE" ]
then
	echo "Could not fin token file '$TOKEN_FILE'"
	exit 1
fi

# Gitea web commander needs the following
# set
export GITEA_WEBHOOK_AUTH=$(cat "$TOKEN_FILE")

echo "PWD: $(pwd)"
ls -la
git pull
./hook.py
