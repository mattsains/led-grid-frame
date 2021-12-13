import Tetromino, { TetrominoShape } from "./tetromino";
("./tetromino");
import Controller, { BUTTON } from "./controller";

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

  /**
   * Bakes a tetromino in the dead tetromino field
   * @param tet the tetromino to bake
   */
  public set(tet: Tetromino): void {
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
        // because the whole grid has now shifted down, we have to make sure we re-process the current row
        row++;
      }
    }
  }
}

export default new (class {
  private activeTet: Tetromino = undefined;
  private deadTets = new DeadTetrominos();

  private controller = new Controller({
    LEFT: [300, 50],
    RIGHT: [300, 50],
    DOWN: [100, 60],
    UP: [0, 0],
    A: [300, 100],
    B: [300, 100],
  });
  private lastFall = Date.now();
  private justDidSoftDrop = false;

  update() {
    let now = Date.now();
    if (this.activeTet == undefined) this.generateActiveTet();

    let preventDrop = false;

    // respond to movement of the tetromino. If it moves, don't immediately drop the tet.
    if (this.moveTetWithButtons()) preventDrop = true;

    // hard drop
    if (this.controller.wasPressed(BUTTON.UP)) {
      let desiredPosition: Tetromino;
      do {
        desiredPosition = this.activeTet.clone();
        desiredPosition.y++;
      } while (this.validateAndSetDesiredTetPosition(desiredPosition));
    }

    // pause drops right after a soft drop. It's easier to predict the movement that way.
    if (this.justDidSoftDrop) {
      this.justDidSoftDrop = false;
      preventDrop = true;
    }

    // soft drop
    if (this.controller.wasPressed(BUTTON.DOWN)) {
      let desiredPosition = this.activeTet.clone();
      desiredPosition.y++;
      if (this.validateAndSetDesiredTetPosition(desiredPosition)) {
        preventDrop = true;
        this.justDidSoftDrop = true;
      }
    }

    let shouldGravity = false;
    {
      let gravityMillis = now - this.lastFall;
      if (gravityMillis > 150) {
        shouldGravity = true;
        this.lastFall = now;
      }
    }
    if (shouldGravity && !preventDrop) {
      let nextDropPosition = this.activeTet.clone();
      nextDropPosition.y += 1;
      if (!this.validateAndSetDesiredTetPosition(nextDropPosition)) {
        // the tetromino hit the bottom
        this.deadTets.set(this.activeTet);
        this.activeTet = undefined;
        this.deadTets.removeFullLines();
      }
    }

    this.controller.update();
    // don't put any code below here
  }

  /**
   * Respond to button presses that move the piece
   * @returns true if the piece moved
   */
  private moveTetWithButtons(): boolean {
    let desiredPosition = this.activeTet.clone();

    let moveAskedFor = false;

    if (this.controller.wasPressed(BUTTON.LEFT)) {
      moveAskedFor = true;
      desiredPosition.x--;
    }
    if (this.controller.wasPressed(BUTTON.RIGHT)) {
      moveAskedFor = true;
      desiredPosition.x++;
    }
    if (this.controller.wasPressed(BUTTON.A)) {
      moveAskedFor = true;
      desiredPosition.rotation -= 1;
    }
    if (this.controller.wasPressed(BUTTON.B)) {
      moveAskedFor = true;
      desiredPosition.rotation += 1;
    }

    return (
      moveAskedFor && this.validateAndSetDesiredTetPosition(desiredPosition)
    );
  }

  /**
   * Tests whether the tetromino will fit in desiredPosition. If it will, it moves the active tetromino there.
   *
   * @param desiredPosition Where the tetromino is trying to go
   * @returns true if the tetromino was moved, false otherwise
   */
  private validateAndSetDesiredTetPosition(
    desiredPosition: Tetromino
  ): boolean {
    const pixels = desiredPosition.convertToPixels();
    const isPixelObstructing =
      pixels
        .map((pos) => this.deadTets.get(...pos))
        .filter((val) => val != undefined).length > 0;
    const isTetFallingOffEdge =
      pixels.filter(([x, y]) => x < 0 || x > 18 || y >= 27).length > 0;

    if (!(isPixelObstructing || isTetFallingOffEdge)) {
      this.activeTet = desiredPosition;
      return true;
    } else return false;
  }

  /**
   * spawn a new tetromino, or restart the game if it's not possible
   */
  private generateActiveTet() {
    const shapes: TetrominoShape[] = ["S", "Z", "L", "J", "O", "I"];
    const chosenShape = shapes[Math.floor(Math.random() * shapes.length)];

    if (
      !this.validateAndSetDesiredTetPosition(
        new Tetromino(18 / 2, 0, Math.round(Math.random() * 3) - 1, chosenShape)
      )
    ) {
      this.deadTets = new DeadTetrominos();
      this.validateAndSetDesiredTetPosition(
        new Tetromino(18 / 2, 0, Math.round(Math.random() * 3) - 1, chosenShape)
      );
    }
  }

  draw(ctx: CanvasRenderingContext2D) {
    this.deadTets.operateOnAll((x, y, color) => {
      ctx.fillStyle = color;
      ctx.fillRect(x, y, 1, 1);
    });
    this.activeTet?.draw(ctx);
  }
})();
