const BOARDSIZE = 5;
const SHIPLENGTH = 3;

module.exports = class Board {
  constructor () {
  }

  placeShips (placements) {
    this.resetCoords();
    placements.forEach((yCoord, xCoord) => {
      this.validateStartingPoint(yCoord);

      if (yCoord >= 0) {
        for (let i = 0; i < 3; i++) {
          let coord = [xCoord, yCoord + i];
          this.updateCoord(coord, 0);
        }
      }
    });
  }

  updateCoord (coord, newValue) {
    this.coords[coord[1]][coord[0]] = newValue;
  }

  at (coord) {
    return this.coords[coord[1]][coord[0]];
  }

  resetCoords () {
    this.coords = [];

    for (let j = 0; j < BOARDSIZE; j++) {
      let row = [];
      this.coords.push(row);

      for (let i = 0; i < BOARDSIZE; i++) {
        row.push(-1);
      }
    }
  }

  validateStartingPoint (point) {
    if (point > BOARDSIZE - SHIPLENGTH) {
      throw new TypeError(`Cannot place ship lower than ${BOARDSIZE - SHIPLENGTH}`);
    }
  }
};
