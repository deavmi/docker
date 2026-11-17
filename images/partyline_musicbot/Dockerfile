FROM debian:latest AS build

RUN apt update
RUN apt upgrade -y
RUN apt install python3-pip -y

# Perform build and installation
ADD https://codeberg.org/rfnxdev/partyline.git src/
WORKDIR src
RUN ls -la && sleep 5

RUN pip install . --break-system-packages

WORKDIR bots/

ENV MUSIC_DIR=/music
ENV SERVER_DESTINATION=4afe81159d0391ad70340a2827dde2c1
ENV ROOM=Broadcast
CMD ["python3", "music_bot.py", "--folder", "$MUSIC_DIR", "$SERVER_DESTINATION", "--room", "ROOM"]
