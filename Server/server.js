var express = require('express');
var app = express();
var server = require('http').Server(app);
var io = require('socket.io')(server);


connctions = []

console.log("the server is running");


io.sockets.on('connection', function (socket) {
    connctions.push(socket);
    console.log('Connection: the number of connected sockets %s',connctions.length);
   
    socket.on('disconnection',function(){
        connctions.splice(connctions.indexOf(socket),1);
        console.log('Disconnection: the number of connected sockets %s',connctions.length);
    });

    socket.on('server port', function (data) {
        console.log("anas    anas")
        console.log(data);
        socket.emit('ios port',{msg:'hi ios client'});
    });
});

server.listen(800);

