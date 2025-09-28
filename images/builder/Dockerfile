# Base image
FROM ubuntu:noble AS base
MAINTAINER "Tristan Brice Velloza Kildaire" "deavmi@redxen.eu"

# Don't allow interactive prompts when using apt
ARG DEBIAN_FRONTEND=noninteractive


# Update base system
RUN apt update
RUN apt upgrade -y

# Instal build dependencies
RUN apt install python3 python3-pip git -y
RUN apt install golang -y
RUN GOBIN=/bin go install github.com/gohugoio/hugo@latest

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

# We start here
FROM base AS builder

# Copy run script
COPY --chown=builder:builder run.sh .
RUN chmod +x /run.sh

# Switch to the effective uid/gid
ENV USER_UID=1000
ENV USER_GID=1003
USER ${USER_UID}:${USER_GID}

# Bring in directory containing scripts directory
# and change directory into it
ENV SCRIPTS_DIR=/scripts
WORKDIR ${SCRIPTS_DIR}

# Start initial helper script
CMD /run.sh
