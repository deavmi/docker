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

# It seems that device mounts seem to mount
# device nodes with a gid that matches the container
# image's `dialout` group. Therefore ensure
# that we add ourselves to whatever gid `dialout`
# refers too as that is the only way we will
# be able to get access to that device node
RUN usermod -aG dialout $(whoami)

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

# Add the directory where pip will
# install binaries to to our PATH
ENV PATH=$PATH:/home/root/.local/bin

# Install reticulum and delete
# the install script
RUN /tmp/./install.sh
RUN rm /tmp/install.sh

# Run the daemon
ENV PYTHONUNBUFFERED=1
CMD sleep 5 && rnsd --config /data