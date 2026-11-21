FROM debian:latest AS build

RUN apt update
RUN apt upgrade -y
RUN apt install python3-pip -y

# Perform build and installation
ADD https://codeberg.org/rfnxdev/partyline.git src/
WORKDIR src
RUN ls -la && sleep 5

RUN pip install . --break-system-packages

RUN apt install python3-tk -y
RUN apt install python3-pyaudio codec2 -y

# Thanks to `kalradivyanshu` on https://github.com/TeamPyOgg/PyOgg/issues/112
# for this. He just pointed to the fact that Ogg-Opus's documentation states
# that you need these packages: https://pyogg.readthedocs.io/en/latest/installation.html#linux
RUN apt install libogg-dev libopusenc-dev libflac-dev libopusfile-dev libopus-dev libvorbis-dev -y

ENV CONFIG_FILE_PATH=/config/config.json
ENV ANNOUNCE_INTERVAL=60
ENV STATS_INTERVAL=60
ENV STATE_DIR=/state
CMD partyline-server --config "$CONFIG_FILE_PATH" --announce $ANNOUNCE_INTERVAL --stats-interval "$STATS_INTERVAL" --statedir "$STATE_DIR" 
