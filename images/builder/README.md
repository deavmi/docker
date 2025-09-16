builder
=======

Provides site-builder.

## Build variables

1. `USER_UID`
	* The user's UID to use when creating the user
	* This affects the rights of the file made and changed
	by the builder
2. `USER_GID`
	* The user's group ID
	* Same reason as above but for the file's group

## Environment variables

1. `GITEA_WEBHOOK_AUTH`
	* To contain the expected token that we use to
	validate whether the incoming hook is valid or
	not
