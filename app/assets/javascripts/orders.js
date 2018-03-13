$(function(){ 
  load_total_order_money()
  
  function load_total_order_money() {
    var total_price = 0;
    var quantity = $('.order_quantity');
    var price = $('.order_price');
    for(i= 0; i < price.length; i++ ) {
      total_price += parseInt(quantity[i].innerText)*parseFloat(price[i].innerText);
    }
    total_price = isNaN(total_price) ? 0 : total_price;
    $('.total_order_price').text(total_price.toLocaleString() +  ' VND');
  }
})
