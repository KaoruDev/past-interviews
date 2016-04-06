!function () {
  window.App = window.App || {};

  var LetterView = Backbone.View.extend({
    className: 'letter',
    attributes: {
      'data-tick-currently-at': '0'
    },
    initialize: function () {
      this.listenTo(this.model, {
        'change:tick': this.updateTick,
        'destroy': this.remove
      });
    },

    render: function () {
      this.$el.html(this.model.get('letter'));
      return this;
    },

    updateTick: function (model, newTick) {
      this.$el.attr('data-tick-currently-at', newTick);
    },

    remove: function () {
      Backbone.View.prototype.remove.apply(this, arguments);
    }
  });

  var UserDashboard = Backbone.View.extend({
    // we can safely assume this script tag will be on DOM since the tags are loaded post body
    template: _.template($('.template-user-dashboard').html()),
    initialize: function () {
      this.listenTo(this.model, 'change:lives change:score', this.render);
    },

    render: function () {
      this.$el.html(this.template(this.model.toJSON()));
      return this;
    }
  });

  App.View = Backbone.View.extend({
    events: {
      'keyup .user-inputs': 'handleGuess'
    },

    initialize: function () {
      this.listenTo(this.model.get('letter_collection'), 'add', this.addLetterView);
      this.listenTo(this.model, 'change:still_alive', this.stopGame);

      this.$letterContainer = this.$('.letter-container');

      this.buildUserDashboard();
    },

    addLetterView: function (letterModel) {
      this.$letterContainer.prepend(
      // If I were expecting this view to get removed, I would keep track of sub children to call remove on them.
      // _.invoke(this.subViews, 'remove') but I don't so...
        new LetterView({
          model: letterModel
        }).render().$el
      )
    },

    buildUserDashboard: function () {
      this.userDashboard = new UserDashboard({
        el: $('.user-dashboard'),
        model: this.model
      }).render();
    },

    stopGame: function (model, still_alive) {
      if (still_alive === false) {
        alert('Sorry bub, you lost the game.');
      }
      this.model.killInterval()
    },

    handleGuess: function (e) {
      var $input = $(e.currentTarget);
      var guess = $input.val();
      this.model.checkAnswer(guess);
      $input.val('');
    }
  });

}();
