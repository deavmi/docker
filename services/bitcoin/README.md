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

## Environment variables

* `USER_UID`
	* The uid of the user to run as
* `USER_GID`
	* the gid of the group of the user
	to run as

## Environment files

You need to create the following
environment files:

### `bitcoin.secrets`

It should contain the following:

```
BITCOIN_RPC_USERNAME=
BITCOIN_RPC_PASSWORD=
```
