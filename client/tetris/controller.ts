const buttonMap = {
  LEFT: 14,
  RIGHT: 15,
  DOWN: 13,
  UP: 12,
  A: 0,
  B: 1,
};

type BUTTON = keyof typeof buttonMap;

export const BUTTON: { [Key in BUTTON]: BUTTON } = {
  LEFT: "LEFT",
  RIGHT: "RIGHT",
  DOWN: "DOWN",
  UP: "UP",
  A: "A",
  B: "B",
};

export default class Controller {
  private controller: Gamepad;

  private lastPressedTime: { [Key in BUTTON]: number } = {
    LEFT: 0,
    RIGHT: 0,
    DOWN: 0,
    UP: 0,
    A: 0,
    B: 0,
  };

  private lastReleasedTime: { [Key in BUTTON]: number } = {
    LEFT: 0,
    RIGHT: 0,
    DOWN: 0,
    UP: 0,
    A: 0,
    B: 0,
  };

  private numberOfPresses: { [Key in BUTTON]: number } = {
    LEFT: 0,
    RIGHT: 0,
    DOWN: 0,
    UP: 0,
    A: 0,
    B: 0,
  };

  private _wasPressed: { [Key in BUTTON]: boolean } = {
    LEFT: false,
    RIGHT: false,
    DOWN: false,
    UP: false,
    A: false,
    B: false,
  };

  constructor(private debounceTimes: { [Key in BUTTON]: [number, number] }) {}
  /**
   * This needs to be called last in an update loop
   */
  update(): void {
    this.controller = [...navigator.getGamepads()].filter((gp) =>
      gp?.id?.includes("Xbox")
    )[0];
    const now = Date.now();

    if (!this.controller) return;

    for (let button in buttonMap) {
      if (this.controller.buttons[buttonMap[button]].pressed) {
        this.lastPressedTime[button] = now;
      } else {
        this.lastReleasedTime[button] = now;
      }

      // now work out the button press for next time:
      this._wasPressed[button] = (() => {
        // TODO: the first time a button is pressed, it can result in a super fast repeat
        if (this.debounceTimes[button][0] == 0) {
          // this means we must have a release before another presss
          if (this.lastPressedTime[button] > this.lastReleasedTime[button]) {
            this.lastReleasedTime[button] = Infinity;
            return true;
          } else return false;
        } else if (
          this.lastPressedTime[button] > this.lastReleasedTime[button]
        ) {
          // the button is being pressed or held down
          if (
            now - this.lastReleasedTime[button] >
            this.debounceTimes[button][0]
          ) {
            // valid button press
            // decide whether to start repeating
            if (
              now -
                this.lastReleasedTime[button] -
                this.debounceTimes[button][0] >
              this.debounceTimes[button][1] * this.numberOfPresses[button]
            ) {
              this.numberOfPresses[button]++;
              return true;
            }
          } else if (!this.numberOfPresses[button]) {
            // button is being held, for less than the single press cooldown, and we have yet to emit a single press
            this.numberOfPresses[button] = 1;
            return true;
          } else {
            // button is begin held, for less than the single press cooldown, and we have already emitted a single press
            // need to wait for repeat to start
            return false;
          }
        } else {
          this.numberOfPresses[button] = 0;
        }
      })();
    }
  }

  wasPressed(button: BUTTON): boolean {
    return this._wasPressed[button];
  }
}
