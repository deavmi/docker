# Use the latest Ubuntu image
# TODO: Pin version
# TODO: Use something more lean
FROM ubuntu:latest AS build

# Set the environment variable(s)
# that matter.
ARG DEBIAN_FRONTEND=noninteractive # Ensures no prompt/dialogs popup during apt usage

# Upgrade system
RUN apt update
RUN apt upgrade -y

# Install build dependencies
RUN apt install git -y
RUN apt-get install build-essential libtool autotools-dev -y
RUN apt-get install build-essential libtool autotools-dev -y
RUN apt-get install automake pkg-config bsdmainutils -y
RUN apt-get install python3 libevent-dev libboost-dev libsqlite3-dev -y

# Perform build
WORKDIR /tmp
RUN git clone https://github.com/bitcoin/bitcoin --depth=1
WORKDIR bitcoin
RUN ./autogen.sh
RUN ./configure
RUN make -j2
RUN make install

# TODO: Pin version
# TODO: Use something more lean
FROM ubuntu:latest AS base

COPY --from=build /bin/bitcoind /bin
RUN chmod +x /bin/bitcoind

RUN apt install curl -y

# Setup user
ARG USER_UID=1000
ARG USER_GID=1003
RUN groupadd bitcoin --gid $USER_GID
RUN useradd bitcoin -m --uid USER_UID --gid USER_GID

# Copy over run script
WORKDIR /home/bitcoin
COPY run.sh .
RUN chmod +x run.sh
RUN chown -R bitcoin:bitcoin /home/bitcoin

# Healthcheck by communicating
# with the RPC via bitcoin-cli
ENV RPC_USERNAME=""
ENV RPC_PASSWORD=""
HEALTHCHECK CMD bitcoin-cli -rpcuser=$RPC_USERNAME -rpcpassword=$RPC_PASSWORD -getinfo

# Switch to the bitcoin user
USER bitcoin

ENV BLOCKS_DIR=/blocks
ENV DATA_DIR=/data

# Run the startup script
CMD ["./run.sh"]
