#!/usr/bin/env bash
# Create a CLTV script with a timestamp of 1495584032 and public key below:
# publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

set -euo pipefail

PUBLIC_KEY="02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277"
LOCKTIME_HEX="20cd2459"
PUBLIC_KEY_HASH=$(printf '%s' "$PUBLIC_KEY" | xxd -r -p | openssl dgst -sha256 -binary | openssl dgst -ripemd160 -binary | xxd -p -c 256)

printf '04%sb17576a914%s88ac\n' "$LOCKTIME_HEX" "$PUBLIC_KEY_HASH"
