# Base image
FROM debian:bookworm AS build
MAINTAINER "Tristan Brice Velloza Kildaire" "deavmi@redxen.eu"

# Don't allow interactive prompts when using apt
ARG DEBIAN_FRONTEND=noninteractive

# Upgrade the system's dependencies
RUN apt update
RUN apt upgrade -y

# Install Python3 and requirements
RUN apt install python3 python3-pip -y

# Install ncat (useful tool)
RUN apt install ncat -y
RUN apt install picocom -y
RUN apt install curl wget -y
RUN apt install net-tools dnsutils iputils-ping -y

# Activate bkuild argument `PURE_INSTALL`
ARG PURE_INSTALL

# Install git (as required by RNGit)
RUN apt install git -y

# Copy across installation
# script
COPY install.sh /tmp
RUN chmod +x /tmp/install.sh

# Add the directory where pip will
# install binaries to to our PATH
ENV PATH=$PATH:/home/root/.local/bin

# Install reticulum and delete
# the install script
RUN /tmp/./install.sh
RUN rm /tmp/install.sh

# Run the daemon
ENV PYTHONUNBUFFERED=1
ENV SLEEP_TIME=5
CMD sleep $SLEEP_TIME && rngit --config /config --print-identity && rngit --config /data --rnsconfig /rns
