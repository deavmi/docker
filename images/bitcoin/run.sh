#!/bin/bash

echo "Blocks directory: $BLOCKS_DIR"
echo "Data directory: $DATA_DIR"
echo "RPC username: $RPC_USERNAME"
echo "RPC password: $RPC_PASSWORD"

bitcoind -blocksdir=$BLOCKS_DIR \
        -datadir=$DATA_DIR \
        -bind=[::]:8334 \
        -rest \
        -rpcbind=[::]:8332 \
        -rpcallowip="::/0" \
        -rpcuser=$RPC_USERNAME \
        -rpcpassword=$RPC_PASSWORD \
        # -server \
