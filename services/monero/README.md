monero
======

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

* `MONERO_MAX_CONNECTIONS`
	* Maximum RPC connections from the same IP
* `MONERO_RPC_PAYMENT_WALLET_ADDR`
	* XMR address for payment for using
	the RPC service
* `MONERO_RPC_PAYMENT_DIFFICULTY`
* `MONERO_RPC_PAYMENT_CREDITS`

## Secrets

The following secrets must be declared:

### `MONERO_NODES`

Such a secret file must be mapped to this
name and should contain line-seperated
IP addresses of Monero nodes to connect to.

## Environment files

You need to create the following
environment files:

### `monero.secrets`

It should contain the following:

```
MONERO_RPC_USERNAME=
MONERO_RPC_PASSWORD=
```
