#!/bin/bash

STATUS=$(curl -s http://localhost:3001/metrics)

if [ "$STATUS" = "healthy" ]; then
  echo "Canary healthy"
  exit 0
else
  echo "Canary unhealthy"
  exit 1
fi
