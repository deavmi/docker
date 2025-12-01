ircd
====

### `.env` (interpolation variables)

Please ensure that the following Docker Compose environment
variables (for interpolation) are set:

1. `IRCD_CONFIG_DIR`
	* The path to your UnrealIRCD configuration directory
2. `USER_UID`
	* The effective user uid to run as
3. `USER_GID`
	* The effectice user gid to run as
