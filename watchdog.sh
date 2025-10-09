#!/bin/bash
# ==============================
# Get GPU worker name
# ==============================
GPU_INFO=$(nvidia-smi --query-gpu=name --format=csv,noheader | head -n1)
GPU_MODEL=$(echo "$GPU_INFO" | sed -E 's/^(NVIDIA |nvidia )//; s/(GeForce |geforce )//; s/(RTX |rtx )//; s/[Ss][Uu][Pp][Ee][Rr]/S/; s/ //g')
ORDER_NUM=$(hostname)
WORKERNAME="${GPU_MODEL}_${ORDER_NUM}"
echo "🎮 GPU worker name: $WORKERNAME"

# ==============================
# Config
# ==============================
APP="/root/gpuminer"   # full path to miner binary
# Append workername to wallet
WALLET="3k4Ytmhw79pBDcs5FvpF3S6ijag1vTSiCRraPU1dF6ADh5sgqWQueeTAnXPeb3oS56kMs9ZhVJVhXdxCtmZBkv7vyBUttFoZSz6iGAv8RK66GSGi3DR1PFnXSikzVpiRZQ8N"
ARGS="--pubkey $WALLET --name=$(hostname) --label=Rental"
CHECK_INTERVAL=5                # seconds between checks
LOGFILE="/root/gpuminer_watchdog.log"

# ==============================
# Loop
# ==============================
echo "[WATCHDOG] Starting watchdog for GPU miner..."
while true; do
    if pgrep -x "$(basename "$APP")" > /dev/null; then
        echo "[WATCHDOG] Miner is running." | tee -a "$LOGFILE"
    else
        echo "[WATCHDOG] Miner not running. Starting..." | tee -a "$LOGFILE"
        $APP $ARGS &
    fi
    sleep $CHECK_INTERVAL
done
