#!/bin/bash
echo "Switching to directory '$DIRECTORY'..."
cd "$DIRECTORY"
echo "Using rate: $RATE"

while [ true ]
do
	git pull
	hugo build .
	sleep $RATE
done
