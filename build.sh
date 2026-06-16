#!/bin/bash
# Build both flyer pages from the single source of truth.
#   index.html  -> retail / direct customers (full YCN branding)
#   broker.html -> brokers (YCN logo + phone/email/website hidden)
# The broker page is identical to the source except for the `broker` flag on <body>,
# so the two versions never drift apart. Re-run this after any edit to the master.
set -e

SRC="/Users/etiennebidart/Documents/YCN/YCN visuals marketing/yacht-charter-flyer-master.html"
DEST="/Users/etiennebidart/Documents/YCN/ycn-flyer-site"
LOCAL_BROKER="/Users/etiennebidart/Documents/YCN/YCN visuals marketing/yacht-charter-flyer-broker.html"

# Retail (unchanged source)
cp "$SRC" "$DEST/index.html"

# Broker (add the broker flag to <body>)
perl -pe 's{^<body>$}{<body class="broker">}' "$SRC" > "$DEST/broker.html"

# Keep a local broker copy in the working folder too
cp "$DEST/broker.html" "$LOCAL_BROKER"

echo "Built:"
echo "  $DEST/index.html   (retail)"
echo "  $DEST/broker.html  (broker)"
echo "  $LOCAL_BROKER  (local broker copy)"
