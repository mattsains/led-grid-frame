import React, { useRef } from 'react';
import Canvas from './canvas';

let webSocket = new WebSocket("ws://192.168.0.199");
declare var FontFace;
const myFont = new FontFace('FreePixel', 'url(FreePixel.ttf)');
(document as any).fonts.add(myFont);

export default () => {
    let ref = useRef<Canvas>(null);
    let canvas: Canvas;

    let scroll = 0;
    let text = "😀🍆🍑😘👌💕🤦‍♀️😎🎶😍🤐😰🤬🤠😈👺"

   function draw() {
        canvas.ctx.clearRect(0,0, 19, 27);
        canvas.ctx.fillStyle = "white";
        canvas.ctx.imageSmoothingEnabled = false;
        canvas.ctx.font = "20pt FreePixel";
        canvas.ctx.fillText(text, 19 - Math.floor(scroll), 23);
        scroll += 0.6;
        if (scroll > canvas.ctx.measureText(text).width + 19) scroll = 0;
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