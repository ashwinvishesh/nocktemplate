#!/bin/bash

set -euo pipefail

# Name of the screen session
SESSION_NAME="miner_1"

# Start gpuminer in a detached screen session
screen -dmS "$SESSION_NAME" ./gpuminer --pubkey=3k4Ytmhw79pBDcs5FvpF3S6ijag1vTSiCRraPU1dF6ADh5sgqWQueeTAnXPeb3oS56kMs9ZhVJVhXdxCtmZBkv7vyBUttFoZSz6iGAv8RK66GSGi3DR1PFnXSikzVpiRZQ8N --name=$(hostname) --label=Rental --threads-per-card=3

# Echo status
echo "gpuminer is running now in screen session '$SESSION_NAME'"

