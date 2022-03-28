import React, { useRef } from 'react';
import { isAssertionExpression, updateLanguageServiceSourceFile } from 'typescript';
import Canvas from './canvas';

let webSocket = new WebSocket("ws://192.168.50.214");
declare var FontFace;
const myFont = new FontFace('FreePixel', 'url(FreePixel.ttf)');
(document as any).fonts.add(myFont);

export default () => {
    let ref = useRef<Canvas>(null);
    let canvas: Canvas;

    let grid: number[][] = [];
    for(let i=0; i<19; i++){
        grid[i] = new Array<number>(27).fill(0);
    }
    
    const createGlider = (g, xPos, yPos) => {
        const color = Math.round(Math.random()* 0xffffff);
        const variations = [
            [[0, 0], [1, 1], [2, 1], [0, 2], [1, 2]],
            [[0, 0], [2, 0], [0, 1], [1, 1], [1, 2]],
            [[1, 0], [2, 0], [0, 1], [1, 1], [2, 2]]
        ];
        const variation = variations[Math.floor(Math.random()*variations.length)];
        for(let [xOff, yOff] of variation) {
            g[xPos + xOff][yPos + yOff] = color;
        }
    }

    const checkGliderPositionSafe = (g, xPos, yPos) => !(g[xPos][yPos] || g[xPos + 1][yPos + 1] || g[xPos + 2][yPos + 1] || g[xPos][yPos + 2] || g[xPos + 1][yPos + 2]);

    createGlider(grid, 1, 1);
    createGlider(grid, 5, 5);
    createGlider(grid, 4, 10);

    let targetGrid: number[][] = [];
    for(let i=0; i<19; i++){
        targetGrid[i] = [...grid[i]];
    }
    const progressMax = 1000;
    let progress = progressMax - 1;

    type ColorElements = [number, number, number];
    const getColorElements = (c: number): ColorElements => [(c&0xff0000)>>16, (c&0xff00)>>8, c&0xff];
    const combineElements = (c: ColorElements): number => (c[0] << 16) + (c[1] << 8) + c[2];

    const combineColor = (colors: number[]): number => {
        if (colors.filter(c => c[0]+c[1]+c[2] == 0).length) console.log("inappropriately combined with background");
        const colorElements = colors.map(getColorElements);
        return combineElements([
            Math.round(Math.sqrt(colorElements.map(c => c[0]*c[0]).reduce((sum, cr) => sum + cr)/colors.length)),
            Math.round(Math.sqrt(colorElements.map(c => c[1]*c[1]).reduce((sum, cr) => sum + cr)/colors.length)),
            Math.round(Math.sqrt(colorElements.map(c => c[2]*c[1]).reduce((sum, cr) => sum + cr)/colors.length))]);
    }
    const combineColorWeighted = (colors: number[], weights: number[]): number => {
        const colorElements = colors.map(getColorElements);
        return combineElements([
            Math.round(colorElements.map((c, i) => c[0] * weights[i]).reduce((sum, cr) => sum + cr)/colors.length),
            Math.round(colorElements.map((c, i) => c[1] * weights[i]).reduce((sum, cr) => sum + cr)/colors.length),
            Math.round(colorElements.map((c, i) => c[2] * weights[i]).reduce((sum, cr) => sum + cr)/colors.length)]);
    }

   function draw() {
        canvas.ctx.clearRect(0,0, 19, 27);
        canvas.ctx.fillStyle = "white";
        
        for (let x=0; x<grid.length; x++) {
            for (let y=0; y<grid[0].length; y++) {
                let combined = combineColorWeighted([targetGrid[x][y], grid[x][y]], [progress/(1.0*progressMax), 1.0 - progress/(1.0*progressMax)]);
                canvas.setPixel(x, y, combined);
            }
        }
    }

    function update() {
        const getValue = (x: number, y: number): number => grid[(x+19)%19][(y+27)%27];

        const getNumNeighbours = (x: number, y: number): number[] => {
            let neighbours = [];
            for (let xoff of [-1, 0, 1]) {
                for (let yoff of [-1, 0, 1]) {
                    if (xoff == 0 && yoff == 0) continue;
                    const val = getValue(x+xoff, y+yoff);
                    if (val != 0)
                        neighbours.push(val);
                }
            }
            return neighbours;
        }

        const mutate = (c: number): number => {
            const elements = getColorElements(c);
            const mag = 5;
            return combineElements(elements.map(e => e + Math.round(Math.random()* mag - (mag/2))) as ColorElements);
        }

        const newGrid = grid.map(col => col.map(cell => cell));
        let newGliderPositions = [];

        for (let x=0; x<19; x++) {
            for (let y = 0; y<27; y++) {
                const neighbours = getNumNeighbours(x, y);
                // rule 1
                if (neighbours.length < 2) newGrid[x][y] = 0;
                // rule 2
                if (neighbours.length > 1 && neighbours.length < 4 && grid[x][y]) {
                    // newGrid[x][y] = mutate(combineColor([...neighbours, grid[x][y]]));
                }
                // rule 3
                if (neighbours.length > 3) newGrid[x][y] = 0;
                // rule 4
                if (neighbours.length == 3) newGrid[x][y] = mutate(combineColor([...neighbours]));
                // rule 5: randomly create a glider
                const numberOfBlacks = grid.map(col => col.filter(cell => getColorElements(cell).reduce((prev, cur) => prev+cur) < 10).length).reduce((prev, cur) => prev+cur);
                if (Math.random() < 0.00002*numberOfBlacks && x < 19 - 3 && y < 27 - 3) {
                    newGliderPositions.push([x, y]);
                }
            }
        }

        for (let [x, y] of newGliderPositions) {
            if(checkGliderPositionSafe(newGrid, x, y)) createGlider(newGrid, x, y);
        }

        targetGrid = newGrid;
        progress = 0;
    }

    setInterval(() => {
        if (canvas == undefined) {
            canvas = ref.current;
        } else {
            if (progress >= progressMax) {
                progress = 0;
                grid = targetGrid;
                update();
            }
            draw();
            progress++;
            if (webSocket.readyState == WebSocket.OPEN) webSocket.send(canvas.getImageData());
        }
    }, 16); //16 => 60fps

    return (<Canvas ref={ref} />);
}