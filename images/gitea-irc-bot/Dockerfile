# TODO: Pin image
# TODO: Switch to debian
FROM ubuntu:noble AS build

# TODO: Set interactive shit and stuff
RUN apt update -y

RUN apt install git -y
RUN apt install dub gcc -y
RUN apt install libssl-dev zlib1g-dev -y

# TODO: Add build args for the branch and commit to checkout
WORKDIR /tmp
RUN git clone https://deavmi.assigned.network/git/deavmi/gitea-irc-bot src/
WORKDIR src/
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
