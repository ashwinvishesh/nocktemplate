#!/bin/bash

set -euo pipefail

# Name of the screen session
SESSION_NAME="miner_1"

# Start gpuminer in a detached screen session
screen -dmS "$SESSION_NAME" ./gpuminer --pubkey=2ob6vm5go3gzjA14eGXkqS3x75mYL6Fz7mPAKmTbbHgytgfb2kwENnmxFbuf7xPAFTv6EdNt5rwSEpn3cwdP8XZARL7tF4FdgHc1dSqirDtrpmcS5HXszfZMMrg6fctV7Dpn --name=$(hostname) --label=Rental

# Echo status
echo "gpuminer is running now in screen session '$SESSION_NAME'"

