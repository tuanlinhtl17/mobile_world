$(function(){
  $('#form_nested_comment').hide();
  nested_comment = function(link, e) {
    e.preventDefault()
    $('#form_nested_comment #comment_parent_id').val(link.id);
    $('#comment-'+ link.id).append(
      $('#form_nested_comment').toggle()
    );
  }
  
  $('.submit-comment').on('click', function(){
    if(getCookie('current_user') == 'false'){
      alert(I18n.t('flash.please_login'))
      window.location.href = "/users/sign_in";
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
