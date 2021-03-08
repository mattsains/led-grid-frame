import * as React from 'react';

export default class extends React.Component {
    scaling = 20;
    actualSize = [19, 27];
    canvasRef = React.createRef<HTMLCanvasElement>();
    ctx: CanvasRenderingContext2D;

    componentDidMount() {
        this.ctx = (this.canvasRef.current as HTMLCanvasElement).getContext('2d');
        this.ctx.scale(this.scaling, this.scaling);
    }

    public setPixel(x: number, y: number, color: number) {
        this.ctx.fillStyle = '#' + color.toString(16).padStart(6, '0');
        this.ctx.fillRect(x, y, 1, 1);
    }

    render() {
        return (<canvas width={this.actualSize[0] * this.scaling} height={this.actualSize[1] * this.scaling} ref={this.canvasRef} />);
    }
}