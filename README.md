Deployment
==========

I use this to deploy my infrastructure.


## Structure

The structure is rather simple. There are three directories within the root
of this repository:

1. `nodes/`
	* Contains various sub-directories which hold the Docker Compose files
	for different nodes I maintain
2. `images/`
	* This contains all the `Dockerfile` definitions
	* The Docker Compose definitions will refer to these in order to re-use
	images
3. `services/`
	* In _some_ cases a base skeleton definition will be present heere for
	certain services.
	* The skeleton may then be sourced in the definitions with `nodes/x/compose.yml`
	where `x` is the name of a node. Here additional arguments (maybe some overrides)
	will be present.
