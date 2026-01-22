#!/bin/bash
set -e

# Remove existing canary ONLY if it exists
if docker ps -a --format '{{.Names}}' | grep -q smart-app-canary; then
  docker rm -f smart-app-canary
fi

docker run -d \
  --name smart-app-canary \
  -p 3001:3000 \
  smart-app:$BUILD_NUMBER
