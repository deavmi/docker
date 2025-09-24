Storage
=======

This repository should contain the required base template
`compose.yml` file which will then **require** a `.env`
in order to correctly operate. The reason for this is that
multiple storage nodes may need to be instantiated.

## Monero

The following environment file must be created:

Called `monero.secrets` and containing:

```
MONERO_RPC_USERNAME=
MONERO_RPC_PASSWORD=
```
