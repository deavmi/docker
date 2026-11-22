# TODO: PIn to a specific image
FROM debian:latest AS base

RUN apt update
RUN apt upgrade -y

RUN apt install mumble-server -y

WORKDIR /

CMD ["mumble-server", "-fg", "-v", "-ini", "/config.ini"]
