#!/usr/bin/env bash
# Create a time-based CSV script that would lock funds for 6 months (using 30-day months)
# Time-based CSV uses 512-second units with the type flag (bit 22) set
# publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

set -euo pipefail

# Six 30-day months is 15,552,000 seconds, or 30,375 CSV units.  Setting
# bit 22 produces 0x4076a7, encoded as the Script number a77640.
echo "03a77640b2752102e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277ac"
