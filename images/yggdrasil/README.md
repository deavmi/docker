Yggdrasil
=========


## Mounts

This expects a file to be **at least readable** at `/etc/yggdrasil.conf`
on the container-side. This must contain the Yggdrasil configuration.

Need to be accessible (for `ioctl`) for instantiating a new TUN adaptor
via the TUN driver control file at `/dev/net/tun`. Your host machine
must forward this, like:

`/dev/net/tun:/dev/net/tun:z`

* The `z` is to make SELinux actually shut up.

## Capabilities needed

* `NET_ADMIN`
	* Add capability for performing needed network manipulation via the
	* `/dev/tun` in order to open tun adaptor
