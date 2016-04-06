!function () {
  window.App = window.App || {};

  var generateNewLetter = function () {
    return _.sample('abcdefghijklmnopqrstuvwxyz');
  };

  var LetterModel = Backbone.Model.extend({
    defaults: function () {
      return {
        letter: generateNewLetter(),
        tick: 0,
        interval_id: undefined,
        interval_ticks: 100
      }
    },

    initialize: function () {
      var interval_id = setInterval(_.bind(this.increaseTick, this), this.get('interval_ticks'));
      this.set('interval_id', interval_id);
    },

    increaseTick: function () {
      var currentTick = this.get('tick');

      if (currentTick > 100) {
        this.destroy();
      } else {
        this.set('tick', ++currentTick);
      }
    },

    destroy: function () {
      clearInterval(this.get('interval_id'));
      Backbone.Model.prototype.destroy.apply(this, arguments);
    }

  });

  var LetterCollection = Backbone.Collection.extend({
    model: LetterModel
  });

  App.Model = Backbone.Model.extend({

    defaults: function () {
      return {
        letter_collection: new LetterCollection(),
        lives: 20,
        score: 0,
        still_alive: true,
        letter_interval: 1000
      }
    },

    begin: function () {
      var letters = this.get('letter_collection');

      this.listenTo(letters, 'destroy', this.deductFromLives);
      this.on('change:score', this.increaseTimer);
      this.on('change:letter_interval', this.resetIntervalTo);
      this.startInterval();
      this.createLetter();
    },

    deductFromLives: function (model, lettersCollection, options) {
      if (options.score) {
        var currentScore = this.get('score');
        currentScore ++;
      } else {
        var currentLives = this.get('lives');

        if (currentLives >= 1) {
          this.set('lives', (currentLives - 1));
        } else {
          this.set('still_alive', false);
        }
      }
    },

    increaseTimer: function () {
      var currentScore = this.get('score');

      if (currentScore > 0 && currentScore % 20 === 0) {
        var newInterval = this.get('letter_interval') * 0.9;
        this.set('letter_interval', newInterval);
      }
    },

    startInterval: function () {
      var letters = this.get('letter_collection');

      var interval_id = setInterval(_.bind(this.createLetter, this), this.get('letter_interval'));

      this.set('interval_id', interval_id);
    },

    createLetter: function () {
      this.get('letter_collection').add({
        interval_ticks: this.get('letter_interval') * 0.1
      });
    },

    resetIntervalTo: function () {
      this.killInterval();
      this.startInterval();
    },

    killInterval: function () {
      clearInterval(this.get('interval_id'));
    },

    checkAnswer: function (guess) {
      var letters = this.get('letter_collection');
      var currentLetterModel = letters.first();
      var currentLetter = currentLetterModel.get('letter');
      var currentScore = this.get('score');
      if (guess === currentLetter) {
        this.set('score', ++ currentScore);
        currentLetterModel.destroy({ score: true });
      } else {
        this.set('score', (currentScore - 1));
      }
    }

  });

}();
