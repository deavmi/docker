monero
======

## Build arguments

* `NPROC`
	* Number of cores to use when building

## Secrets

The following secrets need to be made
available:

* `MONERO_NODES`
	* This should be the file containing
	line-seperated IP addresses of nodes

## Environment variables

The following environment variables
are required:

* `USER_UID`
	* The uid of the user to run as
* `USER_GID`
	* The gid of the group of the user
	to run as
* `MAX_CONNECTIONS`
	* Maximum number of connections to RPC
	from **the same** IP
* `RPC_PAYMENT_WALLET_ADDR`
	* The Monero address where payments
	should be sent for using the RPC
	service
* `RPC_PAYMENT_DIFFICULTY`
	* Difficulty
* `RPC_PAYMENT_CREDITS`
	* Credits
* `LOG_LEVEL`
	* `0` is lowest and `4` is highest
* `LOG_FILE`
	* Log file

* `MONERO_RPC_USERNAME`
	* RPC username
* `MONERO_RPC_PASSWORD`
	* RPC password
