# TODO: PIn to a specific image
FROM debian:latest AS base

RUN apt update
RUN apt upgrade -y

RUN apt install mumble-server -y

RUN mkdir /home/user
# ARG USER_UID=1000
# ARG USER_GID=1000
# RUN chown $USER_UID:$USER_GID /home/user
WORKDIR /home/user

CMD ["mumble-server", "-fg", "-v", "-ini", "/config.ini"]
