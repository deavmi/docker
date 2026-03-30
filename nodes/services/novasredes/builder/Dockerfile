FROM debian:latest

RUN apt update
RUN apt upgrade -y
RUN apt install hugo -y
RUN apt install git -y

COPY run.sh /run.sh

ENV DIRECTORY
ENV RATE
CMD ["/./run.sh", "$DIRECTORY", "$RATE"]
