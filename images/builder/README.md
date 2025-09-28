builder
=======

Provides site-builder.

## Environment variables

1. `USER_UID`
	* The _effective_ user uid to run as
2. `USER_GID`
	* The _effective_ user gid to run as

## Secrets

These are expected to be present in order for
this image to work.

1. `BUIDLER_TOKEN`
	* To contain the expected token that we use to
	validate whether the incoming hook is valid or
	not
