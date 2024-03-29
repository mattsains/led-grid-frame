import React, { useRef } from "react";
import Canvas from "./canvas";

import "./tetris";
import tetris from "./tetris";

let webSocket = new WebSocket("ws://192.168.0.199");
declare var FontFace;
const myFont = new FontFace("FreePixel", "url(FreePixel.ttf)");
(document as any).fonts.add(myFont);

export default () => {
  let ref = useRef<Canvas>(null);
  let canvas: Canvas;

  function update() {
    tetris.update();
  }

  function draw() {
    canvas.ctx.clearRect(0, 0, 19, 27);
    tetris.draw(canvas.ctx);
  }

  setInterval(() => update(), 1);
  setInterval(() => {
    if (canvas == undefined) {
      canvas = ref.current;
    } else {
      draw();
      if (webSocket.readyState == WebSocket.OPEN)
        webSocket.send(canvas.getImageData());
    }
  }, 16); //16 - 60fps

  return <Canvas ref={ref} />;
};
