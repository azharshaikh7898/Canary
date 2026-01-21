#!/bin/bash

ENV=$1
APP=smart-app
VERSION=$BUILD_NUMBER

if [ "$ENV" == "staging" ]; then
  docker rm -f ${APP}-staging || true
  docker run -d --name ${APP}-staging -p 3001:3000 -e VERSION=$VERSION $APP:$VERSION
fi

if [ "$ENV" == "canary" ]; then
  docker rm -f ${APP}-canary || true
  docker run -d --name ${APP}-canary -p 3002:3000 -e VERSION=$VERSION $APP:$VERSION
fi
