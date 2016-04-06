window.CredibleLite.module('Views', function (Views, App, Backbone, Marionette) {
  Views.CompareBtnView = Marionette.ItemView.extend({
    className: 'compare-btn-container',
    template: HandlebarsTemplates['offers/compare-btn'],
    initialize: function () {
      this.listenTo(this.model, 'change:count', this.render);
    },

    events: {
      'click': 'updateFiltered',
    },

    onRender: function () {
      this.$el.toggleClass('display', this.model.get('compare_ready'));
    },

    updateFiltered: function (e) {
      e.preventDefault();

      if (this.model.get('compare_ready') || this.model.get('filtered')) {
        this.model.set('filtered', !this.model.get('filtered'));
        this.$el.toggleClass('filtered', this.model.get('filtered'));
        this.$el.attr('data-filter-by', this.model.get('filtered') ? '.compare' : '*');
      }
    },
  });
});
