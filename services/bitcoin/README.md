bitcoin
=======

## Build arguments

You need to define the following
build arguments:

* `NPROC`
	* The number of cores to use when
	building the source

## Interpolation variables

You need to set the following interpolation
variables:

* `USER_UID`
	* The uid of the user to run as
* `USER_GID`
	* the gid of the group of the user
	to run as
* `BITCOIN_DATA_DIR`
	* Host-side directory for data
* `BITCOIN_BLOCKS_DIR`
	* Host-side directory for blocks
* `BITCOIN_COOKIES_DIR`
	* Host-side directory to use for storing cookies
* `BITCOIN_COOKIE_FILE`
	* Name of the cookie file to create

## Environment variables

* `USER_UID`
	* The uid of the user to run as
* `USER_GID`
	* the gid of the group of the user
	to run as
