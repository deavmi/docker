# Base image
FROM debian:bookworm AS base

# Don't allow interactive prompts when using apt
ARG DEBIAN_FRONTEND=noninteractive

# Upgrade system
RUN apt update
RUN apt upgrade -y

# Install icecast2
RUN apt install icecast2 -y

# For healthcheck
RUN apt install curl -y

# Setup user to run Icecast
RUN groupadd iceuser --gid 1003
RUN useradd iceuser -m --uid 1000 --gid 1003
WORKDIR /home/iceuser

# Delete old config and install
# one from build directory
RUN rm /etc/icecast2/icecast.xml
COPY icecast.xml /etc/icecast2/icecast.xml

# Make all files here accessible
# to our `iceuser` user
RUN chown iceuser:iceuser -v -R /etc/icecast2

# Switch to the Icecast user
USER iceuser

# Run icecast server with our custom config
CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]

# Ensure that the Icecast web interface is
# up
HEALTHCHECK CMD curl http://[::1]:8000