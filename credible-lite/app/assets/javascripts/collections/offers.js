window.CredibleLite.module('Collections', function (Collections, App, Backbone, Marionette, $, _) {
  var compareMax = 5;
  Collections.Offers = Backbone.Collection.extend({
    comparator: function (model) {
      return [-parseInt(model.get('monthly_payment')), -parseInt(model.get('apr'))];
    },

    model: function (data, options) {
      // have to make it a function because can't
      // control when sprockets requires files
      return new App.Models.OfferModel(data, options);
    },

    toggleCompare: function (model) {
      var compareCount = this.where({ select_to_compare: true }).length;
      if (model.get('select_to_compare')) {
        model.set('select_to_compare', false);
        compareCount -= 1;
      } else if (compareCount < compareMax) {
        model.set('select_to_compare', true);
        compareCount += 1;
      }

      this.trigger('compare:selected', this, compareCount);
    },

    url: function (submissionId) {
      return 'api/submissions/' + submissionId + '/offers';
    },

    parse: function (result) {
      return result.offers;
    },

    markTopOffers: function () {
      _.each(this.first(3), function (model) {
        model.set('choice', true);
      });
    },
  });
});
