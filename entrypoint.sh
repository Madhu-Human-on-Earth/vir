#!/bin/sh
set -e

# Replace env placeholders in config and start turnserver
# If TURN_REALM / TURN_USER / TURN_PASS are not set, exit with error
: "${TURN_REALM:?Environment variable TURN_REALM is required (e.g. randiconnect.com)}"
: "${TURN_USER:?Environment variable TURN_USER is required}"
: "${TURN_PASS:?Environment variable TURN_PASS is required}"

# Expand env vars into actual config
envsubst '\${TURN_REALM} \${TURN_USER} \${TURN_PASS}' < /etc/turnserver.conf > /etc/turnserver.conf.real

# Show some info to logs
echo "Starting coturn with realm=${TURN_REALM}, user=${TURN_USER}"

# Start coturn in foreground
exec turnserver -c /etc/turnserver.conf.real --no-daemon
