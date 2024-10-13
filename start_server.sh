#!/bin/bash

/home/vintagestory/server/server.sh start # Start server in the background

while pgrep -f "server" > /dev/null; do
    sleep 1
done # Wait for it to exit

while true; do
    sleep 3600
done # Keep alive to avoid container exit

