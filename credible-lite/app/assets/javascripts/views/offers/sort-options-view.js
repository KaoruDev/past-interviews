window.CredibleLite.module('Views', function (Views, App, Backbone, Marionette, $) {
  var OptionView = Marionette.ItemView.extend({
    className: 'sort-option-container',
    template: HandlebarsTemplates['offers/sort-option'],

    attributes: function () {
      return {
        'data-set': this.model.get('state'),
      };
    },

    events: {
      'click a[data-sort]': 'updateSort',
    },

    updateSort: function (e) {
      e.preventDefault();
      var state = $(e.target).attr('data-sort');
      this.$el.attr('data-set', state);
      this.model.set(this.model.collection.buildStateOptionsForModel(state));
    },
  });

  Views.OffersSortOptionsView = Marionette.CollectionView.extend({
    className: 'clearfix',
    childView: OptionView,
  });
});
