#!/usr/bin/env bash
# Create a time-based CSV script that would lock funds for 6 months (using 30-day months)
# Time-based CSV uses 512-second units with the type flag (bit 22) set
# publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

set -euo pipefail

PUBLIC_KEY="02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277"
CSV_UNITS=$((6 * 30 * 24 * 60 * 60 / 512))
TIME_BASED_SEQUENCE=$((0x400000 | CSV_UNITS))
SEQUENCE_HEX=$(printf '%06x' "$TIME_BASED_SEQUENCE" | sed 's/../& /g' | awk '{print $3 $2 $1}')
PUBLIC_KEY_HASH=$(printf '%s' "$PUBLIC_KEY" | xxd -r -p | openssl dgst -sha256 -binary | openssl dgst -ripemd160 -binary | xxd -p -c 256)

printf '03%sb27576a914%s88ac\n' "$SEQUENCE_HEX" "$PUBLIC_KEY_HASH"
