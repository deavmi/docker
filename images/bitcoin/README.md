bitcoind
========

TODO: Invesigate "knots" and see why (if at all
I would want to switch to it)

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
