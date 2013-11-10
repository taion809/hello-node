//http://docs.docker.io/en/latest/examples/nodejs_web_app/
var express = require('express');

// Constants
var PORT = 80;

// App
var app = express.createServer(express.logger(), express.bodyParser());

app.get('/', function (req, res) {
  res.send('Hello World\n');
});

app.listen(PORT)
console.log('Running on http://localhost:' + PORT);
