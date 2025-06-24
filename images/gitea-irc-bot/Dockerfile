# TODO: Pin image
# TODO: Switch to debian
FROM ubuntu:noble AS build

# TODO: Set interactive shit and stuff
RUN apt update -y

RUN apt install git -y
RUN apt install dub gcc -y
RUN apt install libssl-dev zlib1g-dev -y

# Activate arguments provided as build parameters
ARG BRANCH=master
ARG COMMIT=c8b5403159cbb6077508048845732c457e2fd572

# TODO: Add build args for the branch and commit to checkout
WORKDIR /tmp
RUN git clone https://deavmi.assigned.network/git/deavmi/gitea-irc-bot --branch $BRANCH src/
WORKDIR src/
RUN git checkout $COMMIT
RUN dub build

# TODO: Pin image
# TODO: Switch to debian
FROM ubuntu:noble AS base
COPY --from=build /tmp/src/gitea-irc-bot /bin/bot
RUN chmod +x /bin/bot

# Needed for runtime-linked libraries for D-based
# applications
RUN apt update
# RUN apt install libphobos-dev -y
# TODO: Try to get JUST the needed required library
# RUN apt install ldc -y
RUN apt install libphobos2-ldc-shared106 -y
# RUN apt install libphobos2-ldc -y

# We look for config.json here
WORKDIR /
CMD ["/bin/bot"]
