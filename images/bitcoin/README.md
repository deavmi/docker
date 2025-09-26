bitcoind
========

TODO: Invesigate "knots" and see why (if at all
I would want to switch to it)

## Build arguments

* `NPROC`
	* Number of cores to use when building

## Environment variables

The following environment variables
are required:

* `USER_UID`
	* The uid of the user to run as
* `USER_GID`
	* The gid of the group of the user
	to run as
* `BLOCKS_DIR`
	* Directory to store blocks in
	* **Default:** `/blocks`
* `DATA_DIR`
	* Directory to store data in
	* **Default:** `/data`
* `RPC_USERNAME`
	* RPC username
* `RPC_PASSWORD`
	* RPC password
