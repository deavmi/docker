#!/bin/bash

echo "Blocks directory: $BLOCKS_DIR"
echo "Data directory: $DATA_DIR"
echo "Cookie file path: $RPC_COOKIE_FILE"

echo "Additional args: $@"

bitcoind -blocksdir=$BLOCKS_DIR \
        -datadir=$DATA_DIR \
        -bind=[::]:8334 \
        -rest \
        -rpcbind=[::]:8332 \
        -rpcallowip="::/0" \
        -rpccookiefile=$RPC_COOKIE_FILE \
				$@ \
