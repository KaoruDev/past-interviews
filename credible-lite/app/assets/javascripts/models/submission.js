window.CredibleLite.module('Models', function (Models, App, Backbone, Marionette, $) {
  Models.Submission = Backbone.Model.extend({
    url: function () {
      if (this.isNew()) {
        return 'api/submissions';
      } else {
        return 'api/submissions/' + this.get('id');
      }
    },

    defaults: function () {
      var offersCollection = new App.Collections.Offers();
      var compareModel = new App.Models.CompareModel({ offers_collection: offersCollection });

      return {
        address: '',
        amount: null,
        credit_score: null,
        compare_model: compareModel,
        income: null,
        name:  '',
        offers_collection: offersCollection,
        offers_sort_options_collection: new App.Collections.OffersSortOptions([
          { name: 'APR', key: 'apr' },
          { name: 'Monthly Payment', key: 'payments' },
          { name: 'Term', key: 'term' },
          { name: 'Total Cost', key: 'total_cost' },
        ]),
        phone: '',
        ssn: '',
      };
    },

    fetchOffers: function () {
      var offersCollection = this.get('offers_collection');

      var offersDfd = offersCollection.fetch({
        url: offersCollection.url(this.get('id')),
      }).done(function () {
        offersCollection.markTopOffers();
      });

      return $.when(
        this.fetch(),
        offersDfd
      );
    },

  });
});

