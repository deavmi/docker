Tor
===

The onion router.

## Interpolation variables

1. `TOR_HS_DIR_CONTAINER`
	* Path to the directory on the container-side
		whereby your hiden services will be available
2. `TOR_HS_DIR_HOST`
	* Path to the directory on the host-side whereby
		we are storing our hidden services
3. `TOR_TMP_DIR`
	* Path to hole temporary data for Tor
4. `TOR_CONFIG_DIR`
	* Path to `/etc/tor` on the container-side
	* This is where your `torrc` file lives