window.CredibleLite.module('Models', function (Models, App, Backbone) {
  Models.AppModel = Backbone.Model.extend({
    defaults: function () {
      return {
        submission_model: new App.Models.Submission(),
      };
    },
  });
});
