yggmail-auto
============

## Interpolation variables

You must have the following inerpolation variables
setup:

1. `USER_UID`
	* The effective user _uid_ to run as
2. `USER_GID`
	* The effective user _gid_ to run as
3. `YGGMAIL_PEER`
	* This is the address of the endpoint to connect to (an Yggdrasil peer)
	* Format is `tls://`, `tcp://`, `quic://`
4. `YGGMAIL_STORAGE`
	* Path to where the SQLite3 database is to be stored
5. `YGGMAIL_PASSWORD_HASH_FILE_PATH`
	* This is the path to the BCrypt password hash on your system
