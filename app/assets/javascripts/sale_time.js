$(function() {
  $('#message-sale-off-product').countdown(
    new Date(gon.sale_time),
    function(event) {
      $(this).text(
        event.strftime('%D ' + I18n.t('views.mobiles.show.days') + ' %H:%M:%S')
      );
    }
  );
});