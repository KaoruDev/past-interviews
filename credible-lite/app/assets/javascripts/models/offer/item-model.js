window.CredibleLite.module('Models', function (Models, App, Backbone, Marionette, $, _) {
  Models.OfferModel = Backbone.Model.extend({
    defaults: {
      apr: '',
      choice: false,
      lender_name: '',
      lender_desc: '',
      selected_to_compare: false,
      term: 0,
      total_cost: '',
      total_interest: '',
      monthly_payment: '',
    },

    parse: function (response) {
      return _.extend({
        lender_name: response.lender.name,
        lender_desc: response.lender.description,
      }, response);
    },
  });
});

