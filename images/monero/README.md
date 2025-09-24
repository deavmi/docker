monero
======

## Build arguments

* `USER_UID`
	* The uid of the user to create
* `USER_GID`
	* The gid of the group the created user
	is to belong to
* `NPROC`
	* Number of cores to use when building

## Environment variables

The following environment variables
are required:

* `ENV MAX_CONNECTIONS`
	* Maximum number of connections to RPC
	from **the same** IP
* `ENV RPC_PAYMENT_WALLET_ADDR`
	* The Monero address where payments
	should be sent for using the RPC
	service
* `ENV_RPC_PAYMENT_DIFFICULTY`
	* Difficulty
* `ENV RPC_PAYMENT_CREDITS`
	* Credits
