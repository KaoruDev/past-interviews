window.CredibleLite.module('Models', function (Models, App, Backbone) {
  var defaultMsg = 'Click 2 offers to compare!';
  Models.CompareModel = Backbone.Model.extend({
    defaults: {
      count: 0,
      compare_ready: false,
      filtered: false,
      message: defaultMsg,
    },

    initialize: function (data) {
      this.listenTo(data.offers_collection, 'compare:selected', this.updateCompareCount);
    },

    updateCompareCount: function (collection, count) {
      if (count > 1) {
        this.set({
          compare_ready: true,
          message: 'Compare!',
        });
      } else {
        this.set({
          compare_ready: false,
          message: defaultMsg,
        });
      }

      this.set('count', count);
    },

  });
});
