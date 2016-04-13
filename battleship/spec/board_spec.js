'use strict';
const Board = require('../lib/board.js');
const expect = require('chai').expect;

describe('Board', function () {
  let board;
  beforeEach(function () {
    board = new Board();
  });

  describe('.placeShips', function () {
    context('with [-1, 1, 2, 1, -1]', function () {
      it('will place ships correctly', function () {
        board.placeShips([-1, 1, 2, 1, -1]);

        expect(board.at([1, 1])).to.equal(0, '1, 1');
        expect(board.at([1, 2])).to.equal(0, '1, 2 was not 0');
        expect(board.at([1, 3])).to.equal(0, '1, 3');

        expect(board.at([2, 2])).to.equal(0, '2, 2');
        expect(board.at([2, 3])).to.equal(0, '2, 3 was not 0');
        expect(board.at([2, 4])).to.equal(0, '2, 4');

        expect(board.at([3, 1])).to.equal(0, '3, 1');
        expect(board.at([3, 2])).to.equal(0, '3, 1 was not 0');
        expect(board.at([3, 3])).to.equal(0, '3, 3');
      });
    });
  });

  describe('.validateStartingPoint', function () {
    it('throw an error if value is too high', function () {
      let test = function () {
        board.validateStartingPoint(5);
      };

      expect(test).to.throw(TypeError);
    });
  });

  describe('.updateCoord', function () {
    it('will update the right element', function () {
      board.resetCoords();
      board.updateCoord([0, 1], 1);
      expect(board.at([0, 1])).to.equal(1);

      board.updateCoord([1, 4], 1);
      expect(board.at([1, 4])).to.equal(1);
    });
  });
});
