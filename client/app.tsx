import React, { useRef } from 'react';
import Canvas from './canvas';

let webSocket = new WebSocket("ws://192.168.0.198");

let pixels = new Uint32Array(513).fill(0);
let newPixels = new Uint32Array(513).fill(0);

export default () => {
    let i = 0;
    let j = 0;

    let ref = useRef<Canvas>(null);

    setTimeout(() => {
        ref.current.setPixel(i, j, 0xff);
        ref.current.setPixel(i+1, j, 0xff00);
        ref.current.setPixel(i, j+1, 0xff0000);
        
        i++;
        if (i == 19) {
            j++;
            i = 0;
        }
        for (let m = 0; m< 10; m++) ref.current.setPixel(Math.floor(Math.random()*19), Math.floor(Math.random()*27), Math.floor(Math.random()*0xffffff));

        webSocket.send(ref.current.getImageData());
    }, 500);

    return (<Canvas ref={ref} />);
}