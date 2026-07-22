#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
REPO_ROOT=$(cd "$SCRIPT_DIR/.." && pwd)
DATA_DIR="$REPO_ROOT/.bitcoin"
CONF_FILE="$DATA_DIR/bitcoin.conf"

mkdir -p "$DATA_DIR"

if "$SCRIPT_DIR/bcli.sh" getblockchaininfo >/dev/null 2>&1; then
  echo "Local Regtest node is already running."
  exit 0
fi

RPC_PORT=${RPC_PORT:-29443}
P2P_PORT=${P2P_PORT:-29444}

cat > "$CONF_FILE" <<EOF
regtest=1

[regtest]
rpcuser=user
rpcpassword=password
rpcport=$RPC_PORT
port=$P2P_PORT
fallbackfee=0.0001
EOF

bitcoind -datadir="$DATA_DIR" -daemon

echo "Waiting for local Regtest node to become ready..."
for _ in $(seq 1 30); do
  if "$SCRIPT_DIR/bcli.sh" getblockchaininfo >/dev/null 2>&1; then
    echo "Local Regtest node is ready."
    exit 0
  fi
  sleep 1
done

echo "ERROR: Local Regtest node did not become ready in time."
exit 1
