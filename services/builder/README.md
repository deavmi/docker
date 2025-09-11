builder
=======

Provides site-builder.

## Build variables

1. `USER_UID`
	* The user's UID to use when creating the user
	* This affects the rights of the file made and changed
	by the builder
	* **Also set via interpolation variable**
2. `USER_GID`
	* The user's group ID
	* Same reason as above but for the file's group
	* **Also set via interpolation variable**

## Interpolation variables

Set these in your `.env` file.

1. `BUILDER_GITEA_WEBHOOK_AUTH`
	* Set this to the webhook auth token that Gitea
	  would send to you, this prevents others from
	  sending to your builder and causing it to build
2. `BUILDER_OUTPUT`
	* Where the generated websites our output to
3. `BUILDER_SOURCE`
	* Source to build websites from
