#!/bin/sh

if [ ! "$PURE_INSTALL" = "true" ]
then
        PURE_INSTALL="false"
fi

echo "Using pure RNS: $PURE_INSTALL"

if [ "$PURE_INSTALL" = "true" ]
then
        pip3 install rnspure --break-system-packages
        pip3 install pyserial --break-system-packages
else
        pip3 install rns --break-system-packages
fi

# If in-band interface discovery is requested
if [ "$LXMF_INSTALL" = 1 ]
then
				pip3 install lxmf --break-system-packages
fi