const http = require('http');

const server = http.createServer((req, res) => {
  if (req.url === '/metrics') {
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    return res.end('healthy');
  }

  if (req.url === '/health') {
    res.writeHead(200);
    return res.end('OK');
  }

  res.writeHead(200);
  res.end('Hello from Canary App');
});

server.listen(3000, () => {
  console.log('App running on port 3000');
});
