const http = require('http');

const server = http.createServer((req, res) => {
  if (req.url === '/health') {
    res.writeHead(200);
    return res.end('OK');
  }

  if (req.url === '/metrics') {
    res.writeHead(200);
    return res.end('healthy');
  }

  res.writeHead(200);
  res.end('Hello from Canary App');
});

server.listen(3000, () => {
  console.log('App running on port 3000');
});
