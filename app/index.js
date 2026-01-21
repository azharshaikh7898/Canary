const http = require('http');

const PORT = 3000;
const VERSION = process.env.VERSION || "v1";

const server = http.createServer((req, res) => {
  if (req.url === '/health') {
    res.writeHead(200);
    res.end("OK");
  } else if (req.url === '/version') {
    res.writeHead(200);
    res.end(`App Version: ${VERSION}`);
  } else {
    res.writeHead(200);
    res.end("Smart CI/CD App Running");
  }
});

server.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
