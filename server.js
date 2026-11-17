// Tiny server for Render "Web Service" deploys. Serves public/index.html.
// (Not needed if you deploy as a Render "Static Site".)
const http = require("http");
const fs = require("fs");
const path = require("path");

const file = path.join(__dirname, "public", "index.html");
const port = process.env.PORT || 10000;

http.createServer((req, res) => {
  fs.readFile(file, (err, html) => {
    if (err) {
      res.writeHead(500, { "Content-Type": "text/plain" });
      return res.end("Build output missing. Run: npm run build");
    }
    res.writeHead(200, {
      "Content-Type": "text/html; charset=utf-8",
      "X-Frame-Options": "DENY",
      "Cache-Control": "no-cache"
    });
    res.end(html);
  });
}).listen(port, () => console.log("Ticket Desk running on port " + port));
