export type TetrominoShape =  "S" | "Z" | "L" | "J" | "O" | "I";

type TetrominoShapeDef = {[Property in TetrominoShape]: [number, number][]};


export default class Tetromino {
  constructor(
    public x: number,
    public y: number,
    public rotation: number,
    public shape: TetrominoShape
  ) {
    this.color = this.colors[this.shape];
  }

  public readonly color;

  private readonly shapes: TetrominoShapeDef = {
    S: [
      [0, 0],
      [1, 0],
      [0, 1],
      [-1, 1],
    ],
    Z: [
      [0, 0],
      [-1, 0],
      [0, 1],
      [1, 1],
    ],
    L: [
      [0, -1],
      [0, 0],
      [0, 1],
      [1, 1],
    ],
    J: [
      [0, -1],
      [0, 0],
      [0, 1],
      [-1, 1],
    ],
    O: [
      [0, 0],
      [1, 0],
      [0, 1],
      [1, 1],
    ],
    I: [
      [0, -1],
      [0, 0],
      [0, 1],
      [0, 2],
    ],
  };

  private readonly colors: {[Property in TetrominoShape]: string} = {
    S: "#ff0000",
    Z: "#00ff00",
    L: "#0000ff",
    J: "#00ffff",
    O: "#ff00ff",
    I: "#ffff00"
  };

  clone() {
    return new Tetromino(this.x, this.y, this.rotation, this.shape);
  }

  draw(ctx: CanvasRenderingContext2D) {
    ctx.fillStyle = this.colors[this.shape];
    const pixels = this.getShapePixels();

    pixels.forEach((position) => {
      ctx.fillRect(this.x + position[0], this.y + position[1], 1, 1);
    });
  }

  getShapePixels(): [number, number][] {
    let pixels = this.shapes[this.shape];
    let remainingRotation = this.rotation;
    while (remainingRotation > 0) {
      pixels = pixels.map(([x, y]) => [-y, x]);
      remainingRotation--;
    }
    while (remainingRotation < 0) {
      pixels = pixels.map(([x, y]) => [y, -x]);
      remainingRotation++;
    }

    const leftExtent = this.leftExtent(pixels);
    const rightExtent = this.rightExtent(pixels);
    const hShiftAmount = Math.floor((leftExtent + rightExtent)/2);
    const highestExtent = this.highestExtent(pixels);
    const lowestExtent = this.lowestExtent(pixels);
    const vShiftAmount = Math.floor((highestExtent + lowestExtent)/2);
    
    pixels = pixels.map(([x, y]) => [x - hShiftAmount, y - vShiftAmount]);

    return pixels;
  }

  lowestExtent(pixels = this.convertToPixels()) {
    return Math.max(...pixels.map(([_, y]) => y));
  }

  highestExtent(pixels = this.convertToPixels()) {
    return Math.min(...pixels.map(([_, y]) => y));
  }

  leftExtent(pixels = this.convertToPixels()) {
    return Math.min(...pixels.map(([x, _]) => x));
  }

  rightExtent(pixels = this.convertToPixels()) {
    return Math.max(...pixels.map(([x, _]) => x));
  }

  convertToPixels(): [number, number][] {
    const pixels = this.getShapePixels();
    return pixels.map((pos: [number, number]) => [
      pos[0] + this.x,
      pos[1] + this.y,
    ]);
  }
}
