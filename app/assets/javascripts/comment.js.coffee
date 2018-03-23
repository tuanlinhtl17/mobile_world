$ ->
  $('.infinite-table').infinitePages
    loading: ->
      $(this).text(I18n.t('flash.loading'))
    error: ->
      $(this).button(I18n.t('flash.loading_error'))
