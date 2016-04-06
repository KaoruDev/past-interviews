window.CredibleLite.module('Views', function (Views, App, Backbone, Marionette, $) {
  Views.OffersBezelView = Marionette.LayoutView.extend({
    template: HandlebarsTemplates['offers/bezel'],
    className: 'offers-bezel',
    regions: {
      compareBtnRegion: '.compare-btn-region',
      offersRegion: '.offers-region',
      sortRegion: '.sort-region',
    },

    events: {
      'click a[data-sort]': 'sortOffers',
      'click .compare-btn-container.display': 'filterBy',
      'click .compare-btn-container[data-filter-by="*"]': 'filterBy',
    },

    onRender: function () {
      this.offersRegion.show(new App.Views.OffersListView({
        collection: this.model.get('offers_collection'),
      }));

      this.sortRegion.show(new App.Views.OffersSortOptionsView({
        collection: this.model.get('offers_sort_options_collection'),
      }));

      this.compareBtnRegion.show(new App.Views.CompareBtnView({
        model: this.model.get('compare_model'),
      }));
    },

    sortOffers: function () {
      this.offersRegion
        .currentView
        .resort(this.model.get('offers_sort_options_collection').toIsotopeParams());
    },

    filterBy: function (e) {
      e.preventDefault();
      var filterClass = $(e.currentTarget).attr('data-filter-by');

      this.offersRegion
        .currentView
        .isotopeFilter(filterClass);
    },

  });
});
