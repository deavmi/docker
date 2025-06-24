gitea-irc-bot
=============

## `.env`

Please specify the following interpolation variables:

1. `GITEA_IRC_BOT_CONFIG_PATH`
	* This should point to the file path of a `.json`
	file configuring the configuration.
	* It will be **copied into** the container at runtime,
	therefore restarts will be required for changes to have
	an effect
