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
# TODO: Note this in README.md that only a single config may be present
COPY --from=configs/config.config /etc/unbound/unbound.conf
RUN ls . -la && sleep 10

# Setup zones
RUN mkdir zones
COPY --from=zones * /etc/unbound/zones/
RUN ls zones/ -la && sleep 10

# Start unbound
CMD ["unbound", "-d"]
