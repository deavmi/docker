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

# Directory housing Reticulum daemon state
ENV RETICULUM_DIR=/rrcd/reticulum

# Announce period in seconds (Default: 900 - every 15 minutes)
ENV ANNOUNCE_PERIOD=900

# Logging level
ENV LOG_LEVEL=INFO

# Hub name and greeting
ENV HUB_NAME="My hub"
ENV GREETING="Welcome to my hub!"

# Run with the config file at /config.toml
CMD sleep $SLEEP_TIME && rrcd --config /config.toml --identity $RRCD_IDENTITY/identity --configdir $RETICULUM_DIR \
		--announce-period $ANNOUNCE_PERIOD --room-registry /rrcd/roomsReg/rooms.toml --hub-name "$HUB_NAME" --greeting "$GREETING" \
		--log-level $LOG_LEVEL