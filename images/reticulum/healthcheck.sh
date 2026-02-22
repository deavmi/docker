#!/bin/bash

# If this returns non-0 then RNS hasn't started up yet
rnstatus --config /data
if [ ! $? = 0 ]
then
	exit 1
fi