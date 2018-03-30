$(function() {
  const districts = $('#shop_district_id').html();
  return $('#shop_city_id').change(function() {
    const city = $('#shop_city_id :selected').text();
    const escaped_city = city.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    const options = $(districts).filter(`optgroup[label='${escaped_city}']`).html();
    if (options) {
      return $('#shop_district_id').html(options);
      $('#shop_district_id').parent().show()
    } else {
      return $('#shop_district_id').empty();
    }
  });
});
