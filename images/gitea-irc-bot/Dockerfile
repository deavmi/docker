# Base image (for build)
FROM ubuntu:noble AS build
MAINTAINER "Tristan Brice Velloza Kildaire" "deavmi@redxen.eu"

# Don't allow interactive prompts when using apt
ARG DEBIAN_FRONTEND=noninteractive

# Activate arguments provided as build parameters
ARG BRANCH=master
ARG COMMIT=13dcda2bfc02c018f884c3b9f93a208060e63ce9

RUN apt update -y

RUN apt install git -y
RUN apt install dub gcc -y
RUN apt install libssl-dev zlib1g-dev -y

# Clone source code of correct branch
# and checkout to the correct commit,
# finally perform the build
WORKDIR /tmp
RUN git clone https://deavmi.assigned.network/git/deavmi/gitea-irc-bot --branch $BRANCH src/ --depth 1
WORKDIR src/
RUN git checkout $COMMIT
RUN dub build

# Base image (for deployment)
FROM ubuntu:noble AS base
COPY --from=build /tmp/src/gitea-irc-bot /bin/bot
RUN chmod +x /bin/bot

# Don't allow interactive prompts when using apt
ARG DEBIAN_FRONTEND=noninteractive

# Needed for runtime-linked libraries for D-based
# applications
RUN apt update
RUN apt install libphobos2-ldc-shared106 -y

# We look for config.json here
WORKDIR /
CMD ["/bin/bot"]
