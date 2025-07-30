# Base image
FROM ubuntu:noble AS base
MAINTAINER "Tristan Brice Velloza Kildaire" "deavmi@redxen.eu"

# Don't allow interactive prompts when using apt
ARG DEBIAN_FRONTEND=noninteractive

# Upgrade system
RUN apt update
RUN apt upgrade -y

# Install unbound
RUN apt install unbound -y

# Copy my configuration
WORKDIR /etc/unbound
COPY --from=configs *.conf .

# Setup zones
RUN mkdir zones
COPY --from=zones * zones/

# Start unbound
CMD ["unbound", "-d"]
