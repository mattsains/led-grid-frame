import React, { useRef } from 'react';
import Canvas from './canvas';

let webSocket = new WebSocket("ws://192.168.0.199");
declare var FontFace;
const myFont = new FontFace('FreePixel', 'url(FreePixel.ttf)');
(document as any).fonts.add(myFont);

export default () => {
    let ref = useRef<Canvas>(null);
    let canvas: Canvas;

   function draw() {
        canvas.ctx.clearRect(0,0, 19, 27);
        canvas.ctx.fillStyle = "white";
        
    }

    setInterval(() => {
        if (canvas == undefined) {
            canvas = ref.current;
        } else {
            draw();
            if (webSocket.readyState == WebSocket.OPEN) webSocket.send(canvas.getImageData());
        }
    }, 16); //16 - 60fps

    return (<Canvas ref={ref} />);
}