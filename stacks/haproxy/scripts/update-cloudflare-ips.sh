#!/bin/bash

set -euo pipefail

readonly OUTPUT=/opt/stacks/haproxy/config/cloudflare-ips.lst
readonly TMP="${OUTPUT}.tmp"

trap 'rm -f "$TMP"' EXIT

curl -fsSL https://www.cloudflare.com/ips-v4 > "$TMP"
printf '\n' >> "$TMP"
curl -fsSL https://www.cloudflare.com/ips-v6 >> "$TMP"

if ! cmp -s "$TMP" "$OUTPUT"; then
    mv "$TMP" "$OUTPUT"
    docker kill --signal USR2 haproxy
fi
