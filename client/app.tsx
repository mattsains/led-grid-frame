import React, { useRef } from 'react';
import Canvas from './canvas';

let webSocket = new WebSocket("ws://192.168.0.198");

export default () => {
    let rate = 50;
    let ref = useRef<Canvas>(null);
    let ctx;
    class T {
        x =  0;
        y = 0;
        vx = rate/40;
        vy = rate/40;
        radius = 4;
        red = 0;
        green = 0;
        blue = 255;
        draw() {
            ctx.clearRect(0,0, 19, 27);
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2, true);
            ctx.closePath();
            let color = (this.red << 16) | (this.green << 8) | (this.blue);
            ctx.fillStyle = "#" + color.toString(16).padStart(6, "0");
            ctx.fill();
        }
      }
    let ball = new T();
    function draw() {
        ball.draw();
        ball.x += ball.vx;
        ball.y += ball.vy;
        if (ball.y + ball.vy > 27 || ball.y + ball.vy < 0) {
            ball.vy = -ball.vy;
        }
        if (ball.x + ball.vx > 19 || ball.x + ball.vx < 0) {
            ball.vx = -ball.vx;
        }
        ball.red = Math.max(0, Math.min(255, Math.round(ball.red + 20*(Math.random() - 0.5))));
        ball.green = Math.max(0, Math.min(255, Math.round(ball.green + 20*(Math.random() - 0.5))))
        ball.blue = Math.max(0, Math.min(255, Math.round(ball.blue + 20*(Math.random() - 0.5))))
      }
    setTimeout(() => {
        ctx = ref.current?.ctx;
      
        if (ctx) ball.draw();
    }, rate * 10);

    setInterval(() => {
        if (ctx) draw();
        if (webSocket.readyState == webSocket.CLOSED || webSocket.readyState == webSocket.CLOSING)
            webSocket = new WebSocket("ws://192.168.0.198");
        else
            webSocket.send(ref.current.getImageData());

    }, rate);

    return (<Canvas ref={ref} />);
}