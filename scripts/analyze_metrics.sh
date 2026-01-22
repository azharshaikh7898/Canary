#!/bin/bash

echo "Waiting for canary to be ready..."
sleep 3

STATUS=$(curl -s http://localhost:3001/metrics)

echo "Metrics response: $STATUS"

if [ "$STATUS" = "healthy" ]; then
  echo "Canary healthy"
  exit 0
else
  echo "Canary unhealthy"
  exit 1
fi
