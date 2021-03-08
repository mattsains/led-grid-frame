import * as ws from 'ws';
import * as chalk from 'chalk';

const server = new ws.Server({
    port: 8000
});

server.on('connection', (socket) => {
    socket.on('message', (msg: Buffer) => {
        console.log('received');
        let row = '';
        for (let i=0; i<msg.length; i++) {
            if ((i % 76 == 0) && (i > 0)) {
                console.log(row);
                row = '';
            }
            const blue = msg[i++];
            const green = msg[i++];
            const red = msg[i++];
            row += chalk.rgb(red, green, blue)('▮');
        }
    });
});