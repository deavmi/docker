# Base image
FROM debian:bookworm AS base
MAINTAINER "Tristan Brice Velloza Kildaire" "deavmi@redxen.eu"

# Don't allow interactive prompts when using apt
ARG DEBIAN_FRONTEND=noninteractive

# Upgrade system
RUN apt update
RUN apt upgrade -y

# Dependencies as per (https://i2pd.readthedocs.io/en/latest/devs/building/unix/#debianubuntu)
RUN apt install \
    libboost-date-time-dev \
    libboost-filesystem-dev \
    libboost-program-options-dev \
    libboost-system-dev \
    libssl-dev \
    zlib1g-dev -y

# Base image for building
FROM base AS buildbase

# Install dependencies
RUN apt install git make g++ -y

# Build i2pd proper
FROM buildbase as i2pd_build

# Clone sources (i2pd)
WORKDIR /tmp
ADD https://github.com/PurpleI2P/i2pd.git#openssl src/
# RUN ["git", "clone", "https://github.com/PurpleI2P/i2pd", "--depth", "1", "--branch", "openssl", "src"]
#RUN git checkout $BRANCH # TODO: Add support for this
WORKDIR src/

# Build, move binary to homedir, clean build
ARG NPROC=2
RUN make -j$NPROC
RUN mv i2pd /tmp/i2pd

# Build i2pd-tools
FROM buildbase as i2pd_tools_build

# Clone sources (i2pd-tools)
WORKDIR /tmp
ADD https://github.com/PurpleI2P/i2pd-tools.git#master src/
WORKDIR src/

# Bring in i2pd to the i2pd directory (needed tfor
# building)
ADD https://github.com/PurpleI2P/i2pd.git#openssl i2pd/

# Build, move binary to homedir, clean build
ARG NPROC=2
RUN make -j$NPROC
RUN mv b33address /tmp/b33address
RUN mv famtool /tmp/famtool
RUN mv i2pbase64 /tmp/i2pbase64
RUN mv keygen /tmp/keygen
RUN mv keyinfo /tmp/keyinfo
RUN mv offlinekeys /tmp/offlinekeys
RUN mv regaddr /tmp/regaddr
RUN mv regaddr_3ld /tmp/regaddr_3ld
RUN mv regaddralias /tmp/regaddralias
RUN mv routerinfo /tmp/routerinfo
RUN mv vain /tmp/vain
RUN mv verifyhost /tmp/verifyhost
RUN mv x25519 /tmp/x25519

# Deployment layer
FROM base AS runtime
COPY --from=i2pd_build /tmp/i2pd /bin/i2pd
COPY --from=i2pd_tools_build /tmp/b33address /bin/b33address
COPY --from=i2pd_tools_build /tmp/famtool /bin/famtool
COPY --from=i2pd_tools_build /tmp/i2pbase64 /bin/i2pbase64
COPY --from=i2pd_tools_build /tmp/keygen /bin/keygen
COPY --from=i2pd_tools_build /tmp/keyinfo /bin/keyinfo
COPY --from=i2pd_tools_build /tmp/offlinekeys /bin/offlinekeys
COPY --from=i2pd_tools_build /tmp/regaddr /bin/regaddr
COPY --from=i2pd_tools_build /tmp/regaddr_3ld /bin/regaddr_3ld
COPY --from=i2pd_tools_build /tmp/regaddralias /bin/regaddralias
COPY --from=i2pd_tools_build /tmp/routerinfo /bin/routerinfo
COPY --from=i2pd_tools_build /tmp/vain /bin/vain
COPY --from=i2pd_tools_build /tmp/verifyhost /bin/verifyhost
COPY --from=i2pd_tools_build /tmp/x25519 /bin/x25519

RUN apt install net-tools curl iputils-ping tcpdump -y

# Setup binaries
RUN chmod +x /bin/i2pd
# RUN chmod +x /bin/i2pd-tools

# Copy across run script
COPY run.sh /
RUN chmod +x run.sh

# Run i2pd daemon
ENTRYPOINT ./run.sh
