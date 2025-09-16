prometheus
==========

TODO: Update this, I disabled the following. Using a Docker-controlled
volume now (for state) and want to let somebody copy in the stuff via
image.

The latter partentails overrding `image` with `build:`.

## `.env`

Please ensure that the following interpolation variables
are set:

1. `PROMETHEUS_STATE_DIR`
	* Directory where state data is to be stored
	* This can be wiped now and then, all it would mean is
	you losing your old collected statistics
