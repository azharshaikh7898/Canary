FAILS=0

for i in {1..10}; do
  STATUS=$(curl -s http://localhost/health)
  if [ "$STATUS" != "OK" ]; then
    FAILS=$((FAILS+1))
  fi
  sleep 2
done

if [ $FAILS -gt 2 ]; then
  echo "Canary unhealthy"
  exit 1
fi

echo "Canary healthy"
