# Base image
FROM ubuntu:latest AS build
MAINTAINER "Tristan Brice Velloza Kildaire" "deavmi@redxen.eu"

# Don't allow interactive prompts when using apt
ARG DEBIAN_FRONTEND=noninteractive

# Upgrade the system's dependencies
RUN apt update
RUN apt upgrade -y

# Install required build dependencies
RUN apt install git golang -y

# Build
WORKDIR /tmp
RUN ["git", "clone", "https://github.com/yggdrasil-network/yggdrasil-go", "yggdrasil"]
WORKDIR /tmp/yggdrasil

# Activate arguments provided as build parameters
#
# I have some defaults set over here
# that pulls the a specific version
# from the `develop` branch. The user
# should set this argument to what
# he deems to be the latest stable
# version (or not) he wants to use
ARG BRANCH=develop
ARG COMMIT=47818a1a7c475c3c214e3b25d961b77d55069086

# Perform checkout and build
RUN git checkout $BRANCH # TODO: Are commit ids global?
RUN git checkout $COMMIT
RUN ./build

# Switch to new layer for deployment
# and copy over built binaries
# FROM ubuntu:latest AS base
FROM debian:latest AS base
COPY --from=build /tmp/yggdrasil/yggdrasil /bin
COPY --from=build /tmp/yggdrasil/yggdrasilctl /bin

# Make the bianries executable
RUN chmod +x /bin/yggdrasil
RUN chmod +x /bin/yggdrasilctl

# Run Yggdrasil
CMD ["yggdrasil", "-useconffile", "/etc/yggdrasil.conf"]
