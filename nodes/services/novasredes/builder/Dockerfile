FROM debian:latest

RUN apt update
RUN apt upgrade -y
RUN apt install hugo -y
RUN apt install git -y

COPY run.sh /run.sh

ENV DIRECTORY=/data
ENV RATE=3600
CMD ["/./run.sh", "$DIRECTORY", "$RATE"]
