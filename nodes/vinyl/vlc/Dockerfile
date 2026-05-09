# Base image
FROM debian:bookworm AS base

# Don't allow interactive prompts when using apt
ARG DEBIAN_FRONTEND=noninteractive

# Upgrade system
RUN apt update
RUN apt upgrade -y

# Install vlc
RUN apt install vlc -y

# Setup user to run VLC
RUN groupadd vlcuser --gid 1003
RUN useradd vlcuser -m --uid 1000 --gid 1003
WORKDIR /home/vlcuser

# Copy run script here
COPY run.sh .
RUN chmod +x run.sh
RUN chown vlcuser:vlcuser run.sh

# Switch to the VLC user
USER vlcuser

# Run
CMD ["./run.sh"]