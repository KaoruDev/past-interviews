var expect = require('chai').expect;
var _ = require('underscore');

describe('additionArray', function () {
  it('returns true given [1, 2, 3]', function () {
    expect(additionArray([1, 2, 3])).to.eq(true);
  });

  it('returns false given [1, 2, 3, 10]', function () {
    expect(additionArray([1, 2, 3, 10])).to.eq(false);
  });

  it('returns true given [1, 2, 3, 10, 9]', function () {
    expect(additionArray([1, 2, 3, 10, 9])).to.eq(true);
  });

  it('returns true given [1, 20, 3, 10, 9]', function () {
    expect(additionArray([1, 20, 3, 10, 9])).to.eq(true);
  });
});

function additionArray(numbers) {
  var maxInt = _.max(numbers);
  var maxIdx = numbers.indexOf(maxInt);
  numbers.splice(maxIdx, 1);

  var combinations = buildCombination([], numbers, []);

  return !!_.find(combinations, function (combo) {
    return sum(combo) === maxInt;
  });
}

function buildCombination(active, rest, combinations) {
  if (!rest.length) {
    combinations.push(active);
  } else {
    buildCombination(active.concat(rest[0]), rest.slice(1), combinations);
    buildCombination(active, rest.slice(1), combinations);
  }

  return combinations;
}

function sum(numbers) {
  return _.reduce(numbers, function (sum, num) {
    return sum + num;
  }, 0);
}
