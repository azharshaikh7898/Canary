docker rm -f smart-app-stable || true
docker rename smart-app-canary smart-app-stable
