!function () {

  $(document).on('keyup', function (e) {
    if (App.view && e.keyCode === 27) {
      App.view.stopGame();
    }
  });


  $('.begin-btn').on('click', function () {
    var appModel = new App.Model({});

    App.view = new App.View({
      el: '.main-container',
      model: appModel
    });

    appModel.begin();

    $('.user-inputs').focus();
  });
}();
