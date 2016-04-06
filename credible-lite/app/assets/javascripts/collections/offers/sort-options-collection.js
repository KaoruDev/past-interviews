window.CredibleLite.module('Collections', function (Collections, App, Backbone, Marionette, $, _) {
  var Model = Backbone.Model.extend({
    defaults: {
      order: null,
      state: 'off',
    },
  });

  Collections.OffersSortOptions = Backbone.Collection.extend({
    model: Model,
    buildStateOptionsForModel: function (state) {
      return {
        state: state,
        order: this.setModelsLength(),
      };
    },

    setModelsLength: function () {
      var offLength = this.where({
        state: 'off',
      }).length;

      return this.length - offLength;
    },

    toIsotopeParams: function () {
      var baseParams = {
        sortBy: [],
        sortAscending: {},
      };

      return _.chain(this.models).filter(function (model) {
        return model.get('state') !== 'off';
      }).sortBy(function (model) {
        return model.get('order');
      }).reduce(function (map, model) {
        map.sortBy.push(model.get('key'));
        map.sortAscending[model.get('key')] = model.get('state') === 'asc';
        return map;
      }, baseParams).value();
    },
  });
});
