# Use the latest Ubuntu image
# TODO: Pin image
# TODO: Switch to something more bare
FROM ubuntu:latest

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
RUN make -j2
RUN cp build/*/master/release/bin/* /bin

# Clear out the /tmp and also some
# of the installed build dependencies
RUN apt remove git -y
RUN apt autoremove -y
RUN rm -rf /tmp/monero/

# Setup user
RUN groupadd monero --gid 1003
RUN useradd monero -m --uid 1000 --gid 1003
WORKDIR /home/monero

# Copy across the file containing information
# on which IPv6 nodes to add on startup
COPY nodes.txt .
COPY run.sh .
RUN chmod +x run.sh
RUN chown -R monero:monero /home/monero

# Healthcheck by saying hi to the RPC
RUN apt install curl -y
HEALTHCHECK CMD curl -f --user $RPC_USERNAME:$RPC_PASSWORD http://[::1]:18081/get_info

# Switch to the monero user
USER monero

# Run the startup script
CMD ["./run.sh"]
