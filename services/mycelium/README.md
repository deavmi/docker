mycelium
========

## Interpolation variables

Set the following interpolation variables:

1. `MYCELIUM_DATA_DIR`
	* The path to the data directory whwre keys
	will be stored
2. `MYCELIUM_LOG_OPTION`
	* Logging level
	* Default value: `debug`
3. `MYCELIUM_PEERS_STRING`
	* Peering string
	* Default value: `""`
4. `MYCELIUM_QUIC_PORT`
	* QUIC peering port to listen on
	* Default value: `9651`
5. `MYCELIUM_TCP_PORT`
	* TCP peering port to listen on
	* Default value: `9651`
6. `MYCELIUM_PD_PORT`
	* LAN multicast peer discovery port
	* Default value: `9650`
7. `MYCELIUM_TUN_IFNAME`
	* Name of tun interface to create
	* Default value: `mycelium0`
