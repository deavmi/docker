#!/bin/bash

echo "-----------------------------------------------------"
echo "Chosen PulseAudio device name: $PULSE_SOURCE_DEVICE"
echo "PulseAudio server path: $PULSE_SERVER_PATH"
echo "Icecast hostname: $ICECAST_HOSTNAME"
echo "Icecast mountpoint: $ICECAST_MOUNT_POINT"
echo "Icecast password: $ICECAST_PASSWORD"
echo "-----------------------------------------------------"

# Set to the path of PulseAudio's UNIX domain socket
echo "Using PulseAudio server at UNIX domain socket: $PULSE_SERVER_PATH"

# Set environment variable VLC uses to determine
# the PulseAudio server's address
export PULSE_SERVER=unix:/$PULSE_SERVER_PATH

# Start VLC capturing our PulseAudio device and push that data to Icecast
cvlc "pulse://$PULSE_SOURCE_DEVICE" ":sout=#transcode{vcodec=
none,acodec=vorb,ab=192,channels=2,samplerate=44100,scodec=none}:std{access=shout,mux=ogg,dst=//source:$ICECAST_PASSWORD@$ICECAST_HOSTNAME/$ICECAST_MOUNT_POINT}" ":no-sout-all" ":sout-keep"