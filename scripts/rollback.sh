#!/bin/bash

echo "Rolling back canary deployment..."
docker rm -f smart-app-canary || true
