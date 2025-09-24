monero
======

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
