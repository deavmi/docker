FROM debian:latest AS build

# Update the system
RUN apt update
RUN apt upgrade -y

# Install build dependencies
RUN apt install git -y
RUN apt install cargo rust -y