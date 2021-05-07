const WebSocket = require('ws');

const port = 1234;

const wss = new WebSocket.Server({port});

console.log('create websocket server and port is %d', port);

wss.on('connection', function connection(ws) {
  console.log("conntected");

  ws.on('message', function incoming(message) {
    console.log('server received message: %s', message);

    ws.send('server ack');
  });
});