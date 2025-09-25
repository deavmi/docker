# Use the latest Ubuntu image
# TODO: Pin image
# TODO: Switch to something more bare
# FROM ubuntu:latest AS build
FROM debian:latest AS build

# Set the environment variable(s)
# that matter.
ARG DEBIAN_FRONTEND=noninteractive # Ensures no prompt/dialogs popup during apt usage

# Upgrade system
RUN apt update
RUN apt upgrade -y

# Install build dependencies
RUN apt install git -y # TODO: Switch to from?
RUN apt install build-essential cmake pkg-config libssl-dev libzmq3-dev -y
RUN apt install libunbound-dev libsodium-dev libunwind8-dev liblzma-dev -y
RUN apt install libreadline6-dev libexpat1-dev libpgm-dev qttools5-dev-tools -y
RUN apt install libhidapi-dev libusb-1.0-0-dev libprotobuf-dev protobuf-compiler -y
RUN apt install libudev-dev libboost-chrono-dev libboost-date-time-dev -y
RUN apt install libboost-filesystem-dev libboost-locale-dev libboost-program-options-dev -y
RUN apt install libboost-regex-dev libboost-serialization-dev libboost-system-dev -y
RUN apt install libboost-thread-dev python3 ccache doxygen graphviz -y

# Perform build
WORKDIR /tmp
RUN git clone --recursive https://github.com/monero-project/monero --depth=1
WORKDIR monero
RUN git submodule init
RUN git submodule update
ARG NPROC=2
RUN make -j$NPROC
RUN cp build/*/master/release/bin/* /bin

# TODO: Pin to version
# TODO: Use something more lean
FROM debian:latest AS base
COPY --from=build /tmp/monero/build/*/master/release/bin/* /bin
RUN chmod -R +x /bin # TODO: Only do it to the monero ones EVEN though everything would be executable in `/bin`, duh  

# Runtime dependencies
# RUN apt install libudev-dev libboost-chrono-dev libboost-date-time-dev -y
# RUN apt install libboost-filesystem-dev -y
# RUN apt install libboost-program-options-dev libreadline6-dev -y

# TODO: See which of these are ACTUALLY required
RUN apt update
RUN apt install libssl-dev libzmq3-dev -y
RUN apt install libunbound-dev libsodium-dev libunwind8-dev liblzma-dev -y
RUN apt install libreadline6-dev libexpat1-dev libpgm-dev qttools5-dev-tools -y
RUN apt install libhidapi-dev libusb-1.0-0-dev libprotobuf-dev protobuf-compiler -y
RUN apt install libudev-dev libboost-chrono-dev libboost-date-time-dev -y
RUN apt install libboost-filesystem-dev libboost-locale-dev libboost-program-options-dev -y
RUN apt install libboost-regex-dev libboost-serialization-dev libboost-system-dev -y
RUN apt install libboost-thread-dev python3 ccache doxygen graphviz -y

# Bring in build arguments
ARG USER_UID=1000
ARG USER_GID=1003

# Setup user
RUN groupadd monero --gid $USER_GID
RUN useradd monero -m --uid $USER_UID --gid $USER_GID
WORKDIR /home/monero

# Copy across the file containing information
# on which IPv6 nodes to add on startup
# COPY nodes.txt .
COPY run.sh .
RUN chmod +x run.sh
RUN chown -R monero:monero /home/monero

# Bring in all environment
# variables we need
ENV MAX_CONNECTIONS=5
ENV RPC_PAYMENT_WALLET_ADDR=""
ENV RPC_PAYMENT_DIFFICULTY=""
ENV RPC_PAYMENT_CREDITS=""

ENV MONERO_RPC_USERNAME=""
ENV MONERO_RPC_PASSWORD=""

ENV LOG_LEVEL=0

# Healthcheck by saying hi to the RPC
RUN apt install curl -y
HEALTHCHECK CMD curl -f --user $MONERO_RPC_USERNAME:$MONERO_RPC_PASSWORD http://[::1]:18081/get_info


# Switch to the monero user
USER monero

# Run the startup script
CMD ["./run.sh"]
