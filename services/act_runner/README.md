Act runner
==========

This is the CI/CD runner for Gitea.

## `.env`

Please ensure that the following interpolation variables
are set:

1. `ACT_GITEA_INSTANCE_URL`
	* URL to the Gitea instance we should register with
2. `ACT_GITEA_RUNNER_REGISTRATION_TOKEN`
	* Registration token for Gitea to allow this runner
	to attach
	* You would generate this via the Gitea WebUI
3. `ACT_GITEA_RUNNER_NAME`
	* Name for this runner
4. `ACT_GITEA_RUNNER_LABELS`
	* The labels that this runner should advertise as supporting
	* These are basically Docker Image names that we say we
	support so that Gitea can select us as a candidate runner
	given the CI job's requirements (image platform and versions)
	* TODO: Usually I use something like this: `ubuntu-latest:docker://node:16-bullseye,ubuntu-22.04:docker://node:16-bullseye,ubuntu-20.04:docker://node:16-bullseye,ubuntu-18.04:docker://node:16-buster`
5. `ACT_DATA_DIR`
	* Path to the data directory to store stuff
6. `ACT_CONFIG_PATH`
	* Path to the configuration file to be copied into
	the container on startup.
