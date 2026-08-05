# Base image
FROM ghcr.io/deavmi/rrcd:main AS base
MAINTAINER "Tristan Brice Velloza Kildaire" "deavmi@redxen.eu"

# Don't allow interactive prompts when using apt
ARG DEBIAN_FRONTEND=noninteractive

# Install ncat (useful tool)
RUN apt install ncat -y
RUN apt install picocom -y
RUN apt install curl wget -y
RUN apt install net-tools dnsutils iputils-ping -y

# Activate build argument `PURE_INSTALL`
# install binaries to to our PATH
ENV PATH=$PATH:/home/root/.local/bin

# Run the daemon
ENV PYTHONUNBUFFERED=1
ENV SLEEP_TIME=5

# Directory to hold RRCD state
ENV RRCD_HOME=/rrcd/state

# Directory housing identity
ENV RRCD_IDENTITY=/rrcd/identity

# Run with the config file at /config.toml
CMD sleep $SLEEP_TIME && rrcd --config /config.toml --identity $RRCD_IDENTITY
