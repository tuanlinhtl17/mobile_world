$(function() {
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

  load_total_money()

  $('li input').on('change', function(){
    load_total_money();
    var quantity = $('.order-quantity-'+ this.id).val();
    if (quantity >= 1) {
      $('.next_order').attr('disabled', false);
      $.ajax({
        method: 'PATCH',
        url: '/carts/'+ this.id,
        dataType: 'JSON',
        data: {
          'mobile_id': this.id,
          'quantity': quantity
        }
      });
    } else {
      alert(I18n.t("flash.check_quantity"));
      $('.next_order').attr('disabled', true);
    }
  });

  function load_total_money() {
    var total_price = 0;
    var quantity = $('.quantity');
    var price = $('.price');
    for(i= 0; i < price.length; i++ ) {
      total_price += parseInt(quantity[i].value)*parseFloat(price[i].innerText);
    }
    total_price = isNaN(total_price) ? 0 : total_price;
    $('.total_price').text(total_price.toLocaleString() + ' VND');
  }

  remove_item = function(link) {
    $.ajax({
      method: 'DELETE',
      url: '/carts/'+ link.id,
      data: {mobile_id: link.id}
    }).done(function(){
      $('.order-mobile-'+ link.id).fadeOut('slow', function(c){
        $('.order-mobile-'+ link.id).remove();
        load_total_money();
      });
    }).error(function(){
      alert(I18n.t("flash.delete_item_error"));
    });
  }
  
  $('.color').on('change', function(){
    var color = $('.color-' + this.id + ' option:selected').val();
    $.ajax({
      method: 'PATCH',
      url: '/carts/'+ this.id,
      dataType: 'JSON',
      data: {
        'mobile_id': this.id,
        'color_id': color
      }
    });
  });
})
