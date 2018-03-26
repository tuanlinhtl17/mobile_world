$(function() {
  adsClick = function(ads_id) {
    $.ajax({
      method: 'PATCH',
      url: '/advertisement',
      data: {ads_id: ads_id}
    });
  }
});
