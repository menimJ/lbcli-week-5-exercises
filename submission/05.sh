#!/usr/bin/env bash
# Create a CSV script that would lock funds until one hundred and fifty blocks had passed
# publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

set -euo pipefail

# 150 is 9600 as a minimally encoded Script number.
echo "029600b2752102e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277ac"
