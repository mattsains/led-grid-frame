import React, { useEffect, useRef } from 'react';
import { render } from 'react-dom';
import Canvas from './canvas';

let webSocket = new WebSocket("ws://192.168.0.198");

let pixels = new Uint32Array(513).fill(0);

export default () => {
    let i = 0;
    let j = 0;

    let ref = useRef<Canvas>(null);


    const setPixel = (x: number, y: number, color: number) => {
        pixels[513 - x - y * 19] = color;
        ref.current.setPixel(x, y, color);
    }

    (document as any).setPixel = setPixel;

    setInterval(() => {
        setPixel(i, j, 0xff);
        i++;
        if (i == 19) {
            j++;
            i = 0;
        }

        webSocket.send(pixels);
    }, 100);

    return (<Canvas ref={ref} />);
}