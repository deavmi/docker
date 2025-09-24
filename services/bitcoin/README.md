bitcoin
=======

## Build arguments

You need to define the following
build arguments:

* `USER_UID`
	* The uid of the user to create
* `USER_GID`
	* the gid of the group the user, `USER_UID`,
	will be added to
* `NPROC`
	* The number of cores to use when
	building the source

## Interpolation variables

You need to set the following interpolation
variables:

* `BITCOIN_DATA_DIR`
	* Host-side directory for data
* `BITCOIN_BLOCKS_DIR`
	* Host-side directory for blocks
* `BITCOIN_COOKIES_DIR`
	* Host-side directory to use for storing cookies

## Environment files

You need to create the following
environment files:

### `bitcoin.secrets`

It should contain the following:

```
BITCOIN_RPC_USERNAME=
BITCOIN_RPC_PASSWORD=
```
