# Base image
FROM debian:bookworm AS build
MAINTAINER "Tristan Brice Velloza Kildaire" "deavmi@redxen.eu"

# Don't allow interactive prompts when using apt
ARG DEBIAN_FRONTEND=noninteractive

# Upgrade system
RUN apt update
RUN apt upgrade -y

# Install dependencies
RUN apt install git make g++ -y

# Dependencies as per (https://i2pd.readthedocs.io/en/latest/devs/building/unix/#debianubuntu)
RUN apt install \
    libboost-date-time-dev \
    libboost-filesystem-dev \
    libboost-program-options-dev \
    libboost-system-dev \
    libssl-dev \
    zlib1g-dev -y

# Clone sources
WORKDIR /tmp
RUN ["git", "clone", "https://github.com/PurpleI2P/i2pd", "--depth", "1", "--branch", "openssl", "src"]
#RUN git checkout $BRANCH # TODO: Add support for this
WORKDIR src/

# Build, move binary to homedir, clean build
ARG NPROC=2
RUN make -j$NPROC
RUN mv i2pd /tmp/i2pd

# Deployment layer
FROM debian:bookworm AS base
COPY --from=build /tmp/i2pd /bin/i2pd

# Install required libraries
RUN apt update
RUN apt install libssl3 libboost-program-options1.74.0 -y

# Activate arguments provided as build parameters
ARG USER_UID
ARG USER_GID

# Create the i2pd user
# group
RUN groupadd i2pd -g $USER_GID
RUN useradd -m i2pd -u $USER_UID -g $USER_GID

# Setup binary
RUN chmod +x /bin/i2pd
RUN chown i2pd:i2pd /bin/i2pd

# Copy across run script
COPY run.sh /
RUN chmod +x run.sh
RUN chown i2pd:i2pd run.sh

# Create directory for tunnel configuration
# and hen copy across tunnel files
RUN mkdir /tunnels
COPY --from=tunnelsconfig * /tunnels
RUN chown i2pd:i2pd /tunnels -R -v
RUN ls -la /tunnels && sleep 3

# Switch to i2pd user
USER i2pd
WORKDIR /home/i2pd

# Run i2pd daemon
CMD /run.sh