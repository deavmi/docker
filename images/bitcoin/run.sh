#!/bin/bash

echo "Blocks directory: $BLOCKS_DIR"
echo "Data directory: $DATA_DIR"
echo "RPC username: $RPC_USERNAME"
echo "RPC password: $RPC_PASSWORD"
echo "Cookie file path: $RPC_COOKIE_FILE"

bitcoind -blocksdir=$BLOCKS_DIR \
        -datadir=$DATA_DIR \
        -bind=[::]:8334 \
        -rest \
        -rpcbind=[::]:8332 \
        -rpcallowip="::/0" \
        -cookie_file=$RPC_COOKIE_FILE \
        # -rpcuser=$RPC_USERNAME \
        # -rpcpassword=$RPC_PASSWORD \
        
        # -server \
