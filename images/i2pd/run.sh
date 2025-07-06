#!/bin/sh

# Command-line generation
CMD=""

# If an Yggdrasil address is specified
# then enable it
if [ ! "$MESH_YGGDRASIL_ADDR" = "" ]
then
    CMD="$CMD --meshnets.yggdrasil --meshnets.yggaddress $MESH_YGGDRASIL_ADDR"
    
    # TODO: Add reseed file additional_context requirement
    CMD="$CMD --reseed.yggurls http://[324:71e:281a:9ed3::ace]:7070/,http://[301:65b9:c7cd:9a36::1]:18801/,http://[320:8936:ec1a:31f1::216]/,http://[316:f9e0:f22e:a74f::216]/"
fi

# If IPv6 should be enabled
if [ ! "$ENABLE_IPV6" = "" ]
then
    CMD="$CMD --ipv6"
fi

# If IPv4 should be disabled
if [ ! "$DISABLE_IPV4" = "" ]
then
    # FIXME: Find a way to disable it
    # CMD="$CMD --ipv6"
    echo 1
fi

# Data directory for peer profiles, keys, etc.
# 
# By default assume `/data`
if [ "$DATA_DIR" = "" ]
then
    CHOSEN_DATA_DIR="/data"
else
    CHOSEN_DATA_DIR="$DATA_DIR"
fi

# Set data directory
CMD="$CMD --datadir $CHOSEN_DATA_DIR"

# Configuration directory for
# files like i2pd.conf and tunnels.conf
# 
# By default assume `/config`
if [ "$CONFIG_DIR" = "" ]
then
    CHOSEN_CONFIG_DIR="/config"
else
    CHOSEN_CONFIG_DIR="$CONFIG_DIR"
fi

# Set tunnels directory
# CMD="$CMD --conf $CHOSEN_CONFIG_DIR"

# If we should be a floodfill
if [ ! "$FLOODFILL" = "" ]
then
    CMD="$CMD --floodfill"
fi

# Set tunnels directory to `/tunnels`
CMD="$CMD --tunnelsdir /tunnels"

# Configure web console
# TODO: Figure out how to get this if to work?
# if [ $CONSOLE__BIND_ADDR and $CONSOLE__BIND_PORT ]
# then
    if [ ! $CONSOLE__ROOT ]
    then
        CHOSEN_CONSOLE_ROOT="/"
    else
        CHOSEN_CONSOLE_ROOT=$CONSOLE__ROOT
    fi

    CMD="$CMD --http.enabled 1 --http.address $CONSOLE__BIND_ADDR --http.port $CONSOLE__BIND_PORT --http.strictheaders 0 --http.webroot $CHOSEN_CONSOLE_ROOT"
# fi


# Start
echo "Running with args: '$CMD'"
i2pd $CMD