FROM debian:latest AS build

# Update the system
RUN apt update
RUN apt upgrade -y

# Install build dependencies
RUN apt install git -y
RUN apt install cargo rust -y

# Clone the source and perform
# the build
RUN mkdir /build
WORKDIR /build
RUN git clone https://gitlab.torproject.org/tpo/core/arti.git .

# We build with support for running
# onions services, hence the `onion-service-service`
# (as this isn not included by default)
RUN cargo build -p arti --release --onion-service-service