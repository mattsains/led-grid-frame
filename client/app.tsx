import React, { useRef } from 'react';
import Canvas from './canvas';

let webSocket = new WebSocket("ws://192.168.0.199");

export default () => {
    let rate = 10;
    let ref = useRef<Canvas>(null);
    let ctx;
    class T {
        constructor(x, y, red, green, blue, vx, vy) {
            this.x = x;
            this.y = y;
            this.red = red;
            this.green = green;
            this.blue = blue;
            this.vx = vx
            this.vy = vy;
        }
        x;
        y;
        red;
        green;
        blue;
        vx;
        vy;
        radius = 4;
        draw() {
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2, true);
            ctx.closePath();
            let color = (this.red << 16) | (this.green << 8) | (this.blue);
            ctx.fillStyle = "#" + color.toString(16).padStart(6, "0");
            ctx.fill();
        }
      }
    let balls = [
        new T(0, 0, 0, 255, 255, rate/40, rate/40), 
        new T(0, 0, 0, 255, 0, rate/30, rate/30),
        new T(0, 0, 255, 255, 0, rate/35, rate/35),
        new T(0, 0, 255, 0, 255, rate/20, rate/20),
        new T(0, 0, 255, 255, 255, rate/45, rate/40), 
        new T(0, 0, 255, 255, 0, rate/35, rate/30),
        new T(0, 0, 120, 255, 0, rate/35, rate/35),
        new T(0, 0, 120, 0, 255, rate/25, rate/10),
        new T(0, 0, 255, 0, 0, rate/50, rate/50)
    ];
    function draw() {
        ctx.clearRect(0,0, 19, 27);
        for (let ball of balls) {
        ball.draw();
        ball.x += ball.vx;
        ball.y += ball.vy;
        if (ball.y + ball.vy > 27 || ball.y + ball.vy < 0) {
            ball.vy = -ball.vy;
        }
        if (ball.x + ball.vx > 19 || ball.x + ball.vx < 0) {
            ball.vx = -ball.vx;
        }
        ball.red = Math.max(0, Math.min(255, Math.round(ball.red + (Math.random() - 0.5))));
        ball.green = Math.max(0, Math.min(255, Math.round(ball.green + (Math.random() - 0.5))))
        ball.blue = Math.max(0, Math.min(255, Math.round(ball.blue + (Math.random() - 0.5))))
      }
    }

    setInterval(() => {
        if (!ctx) ctx = ref.current?.ctx;
        else {
            draw();
            webSocket.send(ref.current.getImageData());
        }
    }, 16); //16 - 60fps

    return (<Canvas ref={ref} />);
}