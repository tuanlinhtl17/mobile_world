$(function(){
  function getCookie(cname) {
    var name = cname + '=';
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return '';
  }
  
  $('#form_nested_comment').hide();
  nested_comment = function(link, e) {
    e.preventDefault()
    $('#form_nested_comment #comment_parent_id').val(link.id);
    $('#comment-'+ link.id).append(
      $('#form_nested_comment').toggle()
    );
  }
  
  $('.submit-comment').on('click', function(){
    if(getCookie('current_user') == 'true'){
      $('.submit-comment-form').removeAttr('disabled')
    } else {
      alert(I18n.t('flash.please_login'))
      $('.submit-comment-form').attr('disabled', 'disabled')
    }
  })
  
  show_children = function(link){
    $.ajax({
      method: 'POST',
      url: '/comment_children',
      data: {'parent_id': link.id}
    })
  }
  
  delete_comment = function(link){
    mobile_id = $('.delete_comment').data('mobile_id');
    var confirm_delele = confirm(I18n.t('flash.confirm_delele'));
    if (confirm_delele == true) {
      $.ajax({
        method: 'DELETE',
        url: '/comments/'+ link.id
      }).done(function(data){
        if(data.parent_id == null) {
          $('.comment-section-'+ link.id).hide();
        } else {
          $('#comment-'+ link.id).hide();
        }
      }).error(function() {
        alert(I18n.t('flash.delete_comment_error'));
      })
    }
  }
})
