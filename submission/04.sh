#!/usr/bin/env bash
# Create a CLTV script with a timestamp of 1495584032 and public key below:
# publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

set -euo pipefail

# 1495584032 encoded as a minimally encoded Script number is 20cd2459.
echo "0420cd2459b1752102e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277ac"
