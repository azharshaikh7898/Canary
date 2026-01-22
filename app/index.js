const http = require("http");
const PORT = 3000;
const VERSION = process.env.VERSION;
const START = Date.now();

const server = http.createServer((req, res) => {
  if (req.url === "/health") {
    res.end("OK");
    return;
  }

  if (req.url === "/metrics") {
    res.end(JSON.stringify({
      version: VERSION,
      uptime: Date.now() - START
    }));
    return;
  }

  res.setHeader("X-App-Version", VERSION);
  res.end(`🚀 Smart CI/CD Platform | Version ${VERSION}`);
});

server.listen(PORT);
