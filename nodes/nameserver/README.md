Nameserver
==========

This is the deployment file for my nameserver and recursive-resolver ("DNS server").

## Mounts

### `unbound`

You must mount `/tmp/unbnd` into `/ctl` on the container side. This is so that
Unbound can place its control socket there and be accessible on the host side.

## Requirements

### `unbound`

You must have cloned the unbound source code into `unbound/`.

### `unbound_statistics`

You must have cloned [unbound_exporter](https://github.com/letsencrypt/unbound_exporter) to `unbound_exporter/`.

## Notes

Remember to ensure that `systemd-resolvd` is disabled. This is because it works
as a local resolver and **binds to port `53`** which is something we cannot allow
as we need those ports open for Unbound to listen on (both for authoritative quries
and recursive queries).
