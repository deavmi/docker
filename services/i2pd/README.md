i2pd
====


## `.env`

Please ensure that you specify a value for the following
Docker Compose environment variables (for interpolation):

1. `I2PD_CONF_DIR`
	* To the path on the host-side where the I2PD configuration
	and state should be accessible from
2. `USER_UID`
	* The user ID to use when writing files to the configuration
	directory
3. `USER_GID`
	* The group ID to use when writing files to the configuration
	directory
