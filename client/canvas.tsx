import * as React from 'react';

export default class extends React.Component {
    size = [19, 27];
    canvasRef = React.createRef<HTMLCanvasElement>();
    ctx: CanvasRenderingContext2D;

    componentDidMount() {
        this.ctx = (this.canvasRef.current as HTMLCanvasElement).getContext('2d');
    }

    public setPixel(x: number, y: number, color: number) {
        this.ctx.fillStyle = '#' + color.toString(16).padStart(6, '0');
        this.ctx.fillRect(x, y, 1, 1);
    }

    public getImageData() {
        const imgData = this.ctx.getImageData(0, 0, this.size[0], this.size[1]).data;
        const result = new Uint32Array(this.size[0] * this.size[1]).fill(0);

        for(let i = 0; i < this.size[0] * this.size[1]; i++) {
                const position = i * 4;
                const red = Math.floor(imgData[position] / 10);
                const green = Math.floor(imgData[position + 1] / 10);
                const blue = Math.floor(imgData[position + 2] / 10);
                result[i] = (red << 16) | (green << 8) | (blue);
        }
        return result.reverse();
    }

    render() {
        return (<canvas width={this.size[0]} height={this.size[1]} ref={this.canvasRef} />);
    }
}