window.CredibleLite.module('Views', function (Views, App, Backbone, Marionette, $, _) {
  Views.SubmissionNew = Marionette.ItemView.extend({
    className: 'new-submission-container',

    template: HandlebarsTemplates['submissions/new'],

    ui: {
      $form: 'form',
    },

    events: {
      'submit form': 'newSubmission',
    },

    newSubmission: function (e) {
      e.preventDefault();
      this.model.set('id', undefined, { silent: true });

      var data = _.reduce(this.ui.$form.serializeArray(), function (result, input) {
        result[input.name] = input.value;
        return result;
      }, {});

      this.model.save(data)
        .done(function (submission) {
          App.Routers.submission.navigate('/submissions/' + submission.id, {trigger: true});
        });
    },
  });
});
