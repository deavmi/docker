Deployment
==========

I use this to deploy my infrastructure.


## Structure

The structure is rather simple. There are two directories within the root
of this repository:

1. `nodes/`
	* Contains various sub-directories which hold the Docker Compose files
	for different nodes I maintain
2. `images/`
	* This contains all the `Dockerfile` definitions
	* The Docker Compose definitions will refer to these in order to re-use
	images
