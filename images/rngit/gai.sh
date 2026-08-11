#!/bin/sh

if [ ! "$GAI_PREFER_IPV6" = "true" ]
then
        GAI_PREFER_IPV6="false"
fi

echo "IPv6 is preferred when using getaddrinfo()?: $GAI_PREFER_IPV6"

if [ "$GAI_PREFER_IPV6" = "true" ]
then
        echo "label ::/0 0" >> /etc/gai.conf
fi
