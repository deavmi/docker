# Base image
FROM ubuntu:noble AS base
MAINTAINER "Tristan Brice Velloza Kildaire" "deavmi@redxen.eu"

# Don't allow interactive prompts when using apt
ARG DEBIAN_FRONTEND=noninteractive

# Activate arguments provided as build parameters
ARG USER_UID
ARG USER_GID

# Update base system
RUN apt update
RUN apt upgrade -y

# Instal build dependencies
RUN apt install python3 python3-pip git -y
RUN apt install hugo -y

# Create the builder user
# and delete the `ubuntu`
# user (it comes with this
# in newer Ubuntu images)
# and MAY conflict with
# the `builder` user we want
# to add depending on your
# uid of choice
RUN userdel ubuntu
RUN groupadd builder -g $USER_GID
RUN useradd -m builder -u $USER_UID -g $USER_GID
WORKDIR /home/builder

# Switch to the `builder` user
USER builder

# Install more build dependencies
#
# (Had to pass in the `--break-system-packages`
# to make it stop complaining)
RUN pip install --break-system-packages mkdocs flask
RUN pip install --break-system-packages mkdocs-alabaster
RUN pip install --break-system-packages mkdocs-material
RUN pip install --break-system-packages mkdocs-bootswatch-classic mkdocs-theme-bootstrap4
RUN pip install --break-system-packages mkdocs-exclude
RUN pip install --break-system-packages mkdocs-blogging-plugin mkdocs-cinder mkdocs-git-revision-date-plugin
RUN pip install --break-system-packages mkdocs-print-site-plugin
RUN pip install --break-system-packages mkdocs-no-3rd-party-plugin

# Copy builder code
RUN ["git", "clone", "https://github.com/deavmi/gitea-webhook-commander", "script" ]
WORKDIR script/

# We start here
FROM base AS builder

# Copy run script
COPY --chown=builder:builder run.sh .
RUN chmod +x run.sh

# Start
CMD ./run.sh
