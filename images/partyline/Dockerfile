FROM debian:latest AS build

RUN apt update
RUN apt upgrade -y
RUN apt install python3-pip -y

# Perform build and installation
ADD https://codeberg.org/rfnxdev/partyline.git src/
WORKDIR src
RUN ls -la && sleep 5

RUN pip install . --break-system-packages

ENV CONFIG_FILE_PATH=/config/config.json
CMD ["partyline", "--config", "$CONFIG_FILE_PATH"]
