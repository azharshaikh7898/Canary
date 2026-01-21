#!/bin/bash

STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3002/health)

if [ "$STATUS" != "200" ]; then
  echo "Health check failed!"
  exit 1
fi

echo "Health check passed!"
