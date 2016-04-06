window.CredibleLite.module('Views', function (Views, App, Backbone, Marionette, $, _) {
  var AppView = Marionette.LayoutView.extend({
    template: false,
    regions: {
      submissionRegion: '.submission-region',
    },

    showNewSubmission: function () {
      var submissionView = new App.Views.SubmissionNew({
        model: this.model.get('submission_model'),
      });

      this.submissionRegion.show(submissionView);
    },

    showOffersOf: function (submissionId) {
      var submissionModel = this.model.get('submission_model');
      submissionModel.set('id', submissionId);

      var offersView = new App.Views.OffersBezelView({
        collection: submissionModel.get('offers_collection'),
        model: submissionModel,
      });

      submissionModel.fetchOffers()
        .done(_.bind(function () {
          this.submissionRegion.show(offersView);
        }, this));
    },
  });

  App.on('start', function () {
    App.appView = new AppView({
      el: 'body',
      model: new App.Models.AppModel(),
    });
  });
});
