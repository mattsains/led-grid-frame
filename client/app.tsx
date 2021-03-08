import React, { useEffect, useRef } from 'react';
import { render } from 'react-dom';
import Canvas from './canvas';

let webSocket = new WebSocket("ws://localhost:8000");

let pixels = new Uint32Array(513).fill(0);

export default () => {
    let i = 0;
    let j = 0;

    let ref = useRef<Canvas>(null);


    const setPixel = (x: number, y: number, color: number) => {
        pixels[x + y * 19] = color;
        ref.current.setPixel(x, y, color);
    }

    setInterval(() => {
        setPixel(i, j, Math.floor(Math.random() * 0xffffff));
        i++;
        if (i == 19) {
            j++;
            i = 0;
        }

        webSocket.send(pixels);
    }, 1000);

    return (<Canvas ref={ref} />);
}