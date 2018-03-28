$(document).ready(function() {
  add_to_cart = function(link) {
    var this_id = link.id;
    var quantity = $('.order-quantity-'+ link.id).val();
    var color = $('#show-color option:selected').val();
    if(quantity >= 1){
      $.ajax({
        method: 'POST',
        url: '/carts',
        dataType: 'JSON',
        data: {
          'mobile_id': this_id,
          'quantity': quantity,
          'color_id': color
        }
      }).done(function() {
      alert(I18n.t("flash.add_to_cart"));
      });
    } else {
      alert(I18n.t("flash.check_quantity"));
    }
  }
});
