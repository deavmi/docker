builder
=======

Provides site-builder.

## Environment variables

1. `USER_UID`
	* The _effective_ user uid to run as
2. `USER_GID`
	* The _effective_ group gid to run as

## Interpolation variables

Set these in your `.env` file.

1. `USER_UID`
	* The _effective_ user uid to run as
2. `USER_GID`
	* The _effective_ group gid to run as
2. `BUILDER_OUTPUT`
	* Where the generated websites our output to
3. `BUILDER_SOURCE`
	* Source to build websites from

## Secrets

This needs access to the following secrets:

1. `BUILDER_TOKEN`
	* Set this to the webhook auth token that Gitea
	  would send to you, this prevents others from
	  sending to your builder and causing it to build
