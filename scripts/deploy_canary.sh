docker rm -f smart-app-canary || true

docker run -d --name smart-app-canary \
  -e VERSION=$BUILD_NUMBER smart-app:$BUILD_NUMBER
