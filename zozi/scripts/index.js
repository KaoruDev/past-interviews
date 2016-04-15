var $ = require('jquery');
var _ = require('underscore');

window.$ = $;
function request() {
  return $.Deferred().resolve({
    url: 'http://placekitten.com/300/300',
  });
}

var template = _.template('<img src=\'<%= url %>\'/>');
var $outterContainer = $('.image-container');

$('button').on('click', function () {
  request().done(function (response) {
    $outterContainer.html(template(response));
  });
});

