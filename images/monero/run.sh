#!/bin/bash

# Bring in secret
NODES_FILE=/run/secrets/MONERO_NODES
if [ ! -f "$NODES_FILE" ]
then
	echo "Could not find nodes file '$NODES_FILE'"
	exit 1
fi

# Add IPv6 nodes
#
# Calculate the IPv6 nodes to
# (i.e. use (--add-priority-node=<IPv6 addr>))
# by iterating over the `nodes.txt`
# file line-by-line
addrString=""
for addr in $(cat $NODES_FILE)
do
				echo "Add remote node '$addr'..."
        addrString="--add-priority-node=$addr $addrString"
done

# Detect payment gateway details
#
# Checks to see if any of these
# things are set
paymentArgs=""
if [ ! "$RPC_PAYMENT_WALLET_ADDR" = "" ]
then
        paymentArgs="$paymentArgs --rpc-payment-address=$RPC_PAYMENT_WALLET_ADDR"
        paymentArgs="$paymentArgs --rpc-payment-difficulty=$RPC_PAYMENT_DIFFICULTY"
        paymentArgs="$paymentArgs --rpc-payment-credits=$RPC_PAYMENT_CREDITS"

        echo "Payment RPC mode successfully set to '$paymentArgs'"
else
        echo "Not setting payment RPC mode"
fi

# Start the Monero daemon
monerod --non-interactive \
                --data-dir=/data \
                --public-node \
                --max-connections-per-ip=$MAX_CONNECTIONS \
                --p2p-use-ipv6 --p2p-bind-ipv6=[::] --p2p-bind-port-ipv6=18080 \
                --p2p-external-port=18080 \
                --rpc-use-ipv6 --restricted-rpc --rpc-bind-ipv6-address=[::] --rpc-bind-port=18081 \
                --confirm-external-bind \
                 $addrString \
                 $paymentArgs \
                 --log-level $LOG_LEVEL \
                 --log-file $LOG_FILE \

# TODO: make log level optional and defualt value

# --rpc-login="$RPC_USERNAME:$RPC_PASSWORD" \
