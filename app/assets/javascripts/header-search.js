$(function () {
  $('#search').on('keypress', function (e) {
    $('[data-toggle="popover"]').popover('show');
  });

  $('[data-toggle="popover"]').popover({
    trigger: 'manual',
    container: 'body',
    html: true,
	  content: function() {
      return $('#mobile-search-list').html();
    }
  });

  $(document).click(function (e) {
    $('[data-toggle="popover"],[data-original-title]').each(function () {
      if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
        (($(this).popover('hide').data('bs.popover')||{}).inState||{}).click = false
      }
    });
  });

  $('#search').keypress(function () {
    $.ajax({
      url: '/search',
      dataType: 'script',
      data: { search: this.value }
    });
  });
});
