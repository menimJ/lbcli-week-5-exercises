#!/usr/bin/env bash
# Create a CSV script that would lock funds until one hundred and fifty blocks had passed
# publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

set -euo pipefail

PUBLIC_KEY="02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277"
SEQUENCE_HEX="9600"
PUBLIC_KEY_HASH=$(printf '%s' "$PUBLIC_KEY" | xxd -r -p | openssl dgst -sha256 -binary | openssl dgst -ripemd160 -binary | xxd -p -c 256)

printf '02%sb27576a914%s88ac\n' "$SEQUENCE_HEX" "$PUBLIC_KEY_HASH"
