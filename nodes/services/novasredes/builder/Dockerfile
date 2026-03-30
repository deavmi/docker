FROM fedora:latest

RUN dnf update -y
RUN dnf install hugo -y
RUN dnf install git -y

COPY run.sh /run.sh

ENV DIRECTORY=/data
ENV RATE=3600
CMD ["/./run.sh", "$DIRECTORY", "$RATE"]
