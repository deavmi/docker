i2pd
====


## Build variables

* `USER_UID`
	* The user ID to use for the user we create
* `USER_GID`
	* The group ID to use for the user we create
* `NPROC`
	* The number of build processes to use when building
	* **Default value:** 2

## Contexts

* `tunnelsconf`
  * You must have this context defined as it will be
  mounted to the **build** container so that tunnel
  configuration files can be copied over to the container's
  internal directory for tunnel config files
  * Internally, this will make the files available to
  the **container ONLY** at its `/tunnels`