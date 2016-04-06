window.CredibleLite.module('Views', function (Views, App, Backbone, Marionette) {
  var ChildView = Marionette.ItemView.extend({
    template: HandlebarsTemplates['offers/item'],
    className: function () {
      var choice = this.model.get('choice') ? ' choice' : '';
      return 'offer-container' + choice;
    },

    initialize: function () {
      this.listenTo(this.model, 'change:select_to_compare', this.updateCompare);
    },

    events: {
      'click': 'toggleCompare',
    },

    toggleCompare: function () {
      this.model.collection.toggleCompare(this.model);
    },

    updateCompare: function (model, toggle) {
      this.$el.toggleClass('compare', toggle);
    },

    attributes: function () {
      return {
        'data-apr': this.model.get('apr'),
        'data-payment': this.model.get('monthly_payment'),
        'data-term': this.model.get('term'),
        'data-total-cost': this.model.get('total_cost'),
      };
    },
  });

  var EmptyView = Marionette.ItemView.extend({
    className: 'no-offers-container',
    template: HandlebarsTemplates['offers/empty'],
  });

  Views.OffersListView = Marionette.CollectionView.extend({
    childView: ChildView,
    emptyView: EmptyView,
    onAttach: function () {
      this.$el.isotope({
        itemSelector: '.offer-container',
        getSortData: {
          apr: '[data-apr] parseInt',
          payments: '[data-payment] parseInt',
          term: '[data-term] parseInt',
          total_cost: '[data-total-cost] parseInt',
        },
        masonry: {
          columnWidth: '.offer-container',
        },
      });
    },

    onDestroy: function () {
      this.$el.isotope('destroy');
    },

    resort: function (isotopeOptions) {
      if (isotopeOptions.sortBy[0]) {
        this.$el.isotope(isotopeOptions);
      } else {
        this.$el.isotope({ sortBy: 'original-order' });
      }
    },

    isotopeFilter: function (filterClass) {
      this.$el.isotope({ filter: filterClass });
    },
  });
});
