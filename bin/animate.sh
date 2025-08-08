#!/usr/bin/env bash
set -euo pipefail

# assume anvil deployment
export ETH_RPC_URL=127.0.0.1:8545

if [ $# -eq 0 ]; then
    echo "Usage: $0 <contract_address>"
    echo "Example: $0 0xDc64a140Aa3E981100a9becA4E685f962f0cF6C9"
    exit 1
fi

CONTRACT_ADDRESS="$1"

# enter alternate screen & hide cursor; leave things tidy on exit
printf '\e[?1049h\e[?25l'
trap 'printf "\e[?25h"' EXIT INT TERM HUP

# from arbitrary starting value to a synodic month later
for ts in $(seq -f "%.0f" 123456789 36000 126008232); do
    ts_int256=$(cast to-int256 "$ts")

    # build the frame first (buffered), then draw it in one go
    frame=$(cast call "$CONTRACT_ADDRESS" "$ts_int256" | cast to-ascii)

    # move cursor home, print frame, clear the rest of the screen
    printf '\e[H%s\e[J' "$frame"

    sleep 0.05
done
