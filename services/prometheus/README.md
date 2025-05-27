prometheus
==========

## `.env`

Please ensure that the following interpolation variables
are set:

1. `PROMETHEUS_CONF_DIR`
	* Path to the directory holding the configuration files
2. `PROMETHEUS_STATE_DIR`
	* Directory where state data is to be stored
	* This can be wiped now and then, all it would mean is
	you losing your old collected statistics
