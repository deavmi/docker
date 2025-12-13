# Base image
FROM debian:bookworm AS build
MAINTAINER "Tristan Brice Velloza Kildaire" "deavmi@redxen.eu"

# Don't allow interactive prompts when using apt
ARG DEBIAN_FRONTEND=noninteractive

# Upgrade the system's dependencies
RUN apt update
RUN apt upgrade -y

# Activate arguments provided as build parameters
# ARG USER_UID
# ARG USER_GID

# Install Python3 and requirements
RUN apt install python3 python3-pip -y

# Create the reticulum user
# and group
# RUN groupadd reticulum -g $USER_GID
# RUN useradd -m reticulum -u $USER_UID -g $USER_GID

# Add us to the group which the
# serial device files are grouped
# under (permission-wise)
# RUN usermod reticulum -aG dialout

# Install ncat (useful tool)
RUN apt install ncat -y
RUN apt install picocom -y
RUN apt install curl wget -y
RUN apt install net-tools dnsutils iputils-ping -y

# Activate build argument `GAI_PREFER_IPV6`
ARG GAI_PREFER_IPV6

# Run GAI configuration
COPY gai.sh /tmp
RUN chmod +x /tmp/gai.sh
RUN /tmp/gai.sh
RUN rm /tmp/gai.sh

# Activate build argument `PURE_INSTALL`
ARG PURE_INSTALL

# Copy across installation
# script
COPY install.sh /tmp
RUN chmod +x /tmp/install.sh
RUN chown reticulum:reticulum /tmp/install.sh

# Create running directory
# USER reticulum
# WORKDIR /home/reticulum

# Add the directory where pip will
# install binaries to to our PATH
# ENV PATH=$PATH:/home/reticulum/.local/bin
ENV PATH=$PATH:/home/root/.local/bin

# Install reticulum and delete
# the install script
RUN /tmp/./install.sh
RUN rm /tmp/install.sh

# Run the daemon
CMD sleep 5 && rnsd --config /data
