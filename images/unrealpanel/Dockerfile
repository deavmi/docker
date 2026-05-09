# Base image
FROM ubuntu:latest AS build
# TODO: Switch to debian

# TODO: Add maintainer/label
MAINTAINER "Tristan Brice Velloza Kildaire" "deavmi@redxen.eu"

# Don't allow interactive prompts when using apt
ARG DEBIAN_FRONTEND=noninteractive

# Upgrade the system's dependencies
RUN apt update
RUN apt upgrade -y

# Install git
RUN apt install git -y

# Setup installation directory
# and clone source code into it
ENV INSTALL_DIR=/var/www/html
RUN mkdir $INSTALL_DIR -p
WORKDIR $INSTALL_DIR
RUN git clone https://github.com/unrealircd/unrealircd-webpanel .

# Install compose for building
# and then build
RUN apt install composer -y
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN composer install

# New layer, copy across $INSTALL_DIR
# (TODO: Pin version and switch to debian)
FROM nginx AS base
COPY --from=build /var/www/html /usr/share/nginx/html

# Install nginx and PHP
# RUN apt install nginx -y
# USER root
RUN apt update
RUN apt install php php-zip php-curl php-mbstring -y
RUN whoami && sleep 5

RUN apt install php-fpm -y

# Now, NGINX would have made an www-data user,
# make all files in $INSTALL_DIR owned by it
# RUN chown www-data /var/www/html -R -v
# RUN chown root /var/www/html -R -v

RUN ls -la /usr/share/nginx/html && sleep 7


WORKDIR /usr/share/nginx/html
# RUn apt install composer -y
# ENV COMPOSER_ALLOW_SUPERUSER=1
# RUN composer install
# RUN chmod +x *.php

# USER
COPY nginx.conf /etc/nginx/nginx.conf


RUN rm /usr/share/nginx/html/index.html
RUN echo hi > index.html

# RUN

# RUn ls -la /bin && slep
# RUn ls -la /bin && slep



CMD php-fpm8.2  && nginx

# CMD php-fpm8.2 \
		# sleep 2 \
		# chown root:root /var/run/php/*.sock \
		 # nginx