ircd
====


## Build arguments

Please ensure that these are set so that the image
can be built:

1. `USER_UID`
	* The user id to use when creating the user
2. `USER_GID`
	* The user group id to use when creating the
	user
3. `BRANCH`
	* The branch to checkout to
	* **Default value:** `unreal60_dev`
4. `COMMIT`
	* The commit hash to use
	* **Default value:** `HEAD`
