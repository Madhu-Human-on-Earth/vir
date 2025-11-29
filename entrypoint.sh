#!/bin/sh
# Replace placeholders in config with env values and start turnserver
envsubst < /etc/turnserver.conf > /etc/turnserver.conf.real
exec turnserver -c /etc/turnserver.conf.real --no-daemon
