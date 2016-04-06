window.CredibleLite.module('Routers', function (Routers, App, Backbone) {
  var Router = Backbone.Router.extend({
    routes: {
      'submissions/new': 'newSubmission',
      'submissions/:id': 'showSubmission',
      '': 'toNewSubmission',
    },

    regions: {
      '#main-content': null,
    },

    toNewSubmission: function () {
      this.navigate('/submissions/new', {trigger: true});
    },

    newSubmission: function () {
      App.appView.showNewSubmission();
    },

    showSubmission: function (id) {
      App.appView.showOffersOf(id);
    },
  });

  Routers.submission = new Router();
});
