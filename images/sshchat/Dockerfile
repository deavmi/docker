# Base image
FROM debian:bookworm AS build
MAINTAINER "Tristan Brice Velloza Kildaire" "deavmi@redxen.eu"

# Don't allow interactive prompts when using apt
ARG DEBIAN_FRONTEND=noninteractive

# Update the system
RUN apt update
RUN apt upgrade -y

# Install build dependencies
RUN apt install git golang make -y

# Fetch source
WORKDIR /tmp
RUN ["git", "clone", "https://github.com/shazow/ssh-chat", "--depth", "1"]
WORKDIR /tmp/ssh-chat

# Build
RUN make build
RUN cp ssh-chat /bin/

# Fresh layer and copy over binary
FROM debian:bookworm AS base
COPY --from=build /bin/ssh-chat /bin
RUN chmod +x /bin/ssh-chat

# Setup user to run SSH chat
RUN useradd sshchat -m
USER sshchat
WORKDIR /home/sshchat

# Run SSH chat server
CMD ["ssh-chat", "--admin=admins.keys", "--identity=id_rsa"]
