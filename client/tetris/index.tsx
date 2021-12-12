interface Tetromino_Shapes {
  [k: string]: [number, number][];
}

class Tetromino {
  constructor(
    public x: number,
    public y: number,
    public rotation: number,
    public shape: "S" | "Z" | "L" | "J" | "O" | "I"
  ) {
    this.color = this.colors[this.shape];
  }

  public readonly color;

  private readonly shapes: Tetromino_Shapes = {
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

  private readonly colors = {
    S: "#ff0000",
    Z: "#00ff00",
    L: "#0000ff",
    J: "#00ffff",
    O: "#ff00ff",
    I: "#ffff00",
  };

  clone() {
    return new Tetromino(this.x, this.y, this.rotation, this.shape);
  }

  draw(ctx: CanvasRenderingContext2D) {
    ctx.fillStyle = this.colors[this.shape];
    let pixels = this.getShapePixels();

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
    return pixels;
  }

  lowestExtent() {
    return Math.max(...this.convertToPixels().map((pixel) => pixel[1]));
  }

  convertToPixels(): [number, number][] {
    let pixels = this.getShapePixels();
    return pixels.map((pos: [number, number]) => [
      pos[0] + this.x,
      pos[1] + this.y,
    ]);
  }
}

class DeadTetrominos {
  private pixels: string[][] = [];

  public get(x: number, y: number): string {
    return (this.pixels[y] ?? [])[x];
  }

  public operateOnAll(func: (x: number, y: number, color: string) => unknown) {
    this.pixels.forEach((row, y) => {
      row.forEach((color, x) => {
        func(x, y, color);
      });
    });
  }

  public setPixel(x: number, y: number, color: string) {
    if (this.pixels[y] == undefined) this.pixels[y] = [];
    this.pixels[y][x] = color;
  }

  public set(tet: Tetromino) {
    tet.convertToPixels().forEach((pixel) => {
      this.setPixel(...pixel, tet.color);
    });
  }

  public removeFullLines() {
    for (let row = 26; row >= 0; row--) {
      if (
        (this.pixels[row] ?? []).filter((pixel) => pixel !== undefined)
          .length == 19
      ) {
        for (let row2 = row; row2 >= 0; row2--) {
          if (this.pixels[row2 - 1]) this.pixels[row2] = this.pixels[row2 - 1];
          else {
            delete this.pixels[row2];
            break;
          }
        }
      }
    }
  }
}

export default new (class {
  private activeTetromino: Tetromino = undefined;
  private deadTets = new DeadTetrominos();

  private lastGravity = Date.now();
  private lastBtnPress = {
    LEFT: Date.now(),
    RIGHT: Date.now(),
    DOWN: Date.now(),
    X: Date.now(),
    Y: Date.now(),
    A: Date.now(),
    B: Date.now(),
  };

  constructor() {
    for (let i = 0; i < 19; i++)
      if (i !== 8) this.deadTets.setPixel(i, 26, "#fff");
  }

  update() {
    let now = Date.now();
    if (this.activeTetromino == undefined) {
      const shapes: ("S" | "Z" | "L" | "J" | "O" | "I")[] = [
        "S",
        "Z",
        "L",
        "J",
        "O",
        "I",
      ];
      const chosen = shapes[Math.floor(Math.random() * shapes.length)];

      this.activeTetromino = new Tetromino(
        Math.round(1 + Math.random() * 17),
        0,
        Math.round(Math.random() * 3) - 1,
        chosen
      );
      console.log(this.activeTetromino);
    }

    let controller = [...navigator.getGamepads()].filter((gp) =>
      gp?.id?.includes("Xbox")
    )[0];

    let LEFT = 14;
    let RIGHT = 15;
    let DOWN = 13;
    let A = 0;
    let B = 1;
    let X = 2;
    let Y = 3;

    if (controller) {
      let btnState = {
        LEFT:
          controller.buttons[LEFT].pressed && this.lastBtnPress.LEFT < now - 80
            ? now
            : this.lastBtnPress.LEFT,
        RIGHT:
          controller.buttons[RIGHT].pressed &&
          this.lastBtnPress.RIGHT < now - 80
            ? now
            : this.lastBtnPress.RIGHT,
        DOWN:
          controller.buttons[DOWN].pressed && this.lastBtnPress.DOWN < now - 80
            ? now
            : this.lastBtnPress.DOWN,
        X:
          controller.buttons[X].pressed && this.lastBtnPress.X < now - 80
            ? now
            : this.lastBtnPress.X,
        Y:
          controller.buttons[Y].pressed && this.lastBtnPress.Y < now - 80
            ? now
            : this.lastBtnPress.Y,
        A:
          controller.buttons[A].pressed && this.lastBtnPress.A < now - 200
            ? now
            : this.lastBtnPress.A,
        B:
          controller.buttons[B].pressed && this.lastBtnPress.B < now - 200
            ? now
            : this.lastBtnPress.B,
      };

      let desiredPosition = this.activeTetromino.clone();

      if (btnState.LEFT == now) desiredPosition.x--;
      else if (btnState.RIGHT == now) desiredPosition.x++;
      else if (btnState.A == now) desiredPosition.rotation -= 1;
      else if (btnState.B == now) desiredPosition.rotation += 1;

      let pixels = desiredPosition.convertToPixels();
      if (
        pixels
          .map((pos) => this.deadTets.get(...pos))
          .filter((val) => val != undefined).length == 0 &&
        pixels.filter(([x, y]) => x < 0 || x > 18).length == 0
      )
        this.activeTetromino = desiredPosition;

      this.lastBtnPress = { ...btnState };

      if (btnState.DOWN == now) {
        let desiredPosition = this.activeTetromino.clone();

        while (
          desiredPosition.lowestExtent() < 27 &&
          desiredPosition
            .convertToPixels()
            .map((pos) => this.deadTets.get(...pos))
            .reduce((res, val) => (res = res && val == undefined), true)
        ) {
          desiredPosition.y++;
        }
        desiredPosition.y--;
        this.activeTetromino = desiredPosition;
      }

      let shouldGravity = false;
      {
        let gravityMillis = now - this.lastGravity;
        if (gravityMillis > 250) {
          shouldGravity = true;
          this.lastGravity = now;
        }
      }
      if (shouldGravity) {
        let nextPosition = this.activeTetromino.clone();
        nextPosition.y += 1;
        let canDrop =
          nextPosition.lowestExtent() < 27 &&
          nextPosition
            .convertToPixels()
            .map((pos) => this.deadTets.get(...pos))
            .reduce((res, val) => (res = res && val == undefined), true);

        if (canDrop) this.activeTetromino = nextPosition;
        else {
          this.deadTets.set(this.activeTetromino);
          this.activeTetromino = undefined;
          this.deadTets.removeFullLines();
        }
      }
    }
  }

  draw(ctx: CanvasRenderingContext2D) {
    this.deadTets.operateOnAll((x, y, color) => {
      ctx.fillStyle = color;
      ctx.fillRect(x, y, 1, 1);
    });
    this.activeTetromino?.draw(ctx);
  }
})();
