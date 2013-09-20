$(document).ready ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).after($(this).data('fields').replace(regexp, time))
    event.preventDefault()
  
  $('#lesson_tabs a:first').tab('show')
    
  $(".alert").delay(3000).fadeOut('slow');
  
  $(".link-slide").click ->
    $("#panel").slideToggle "slow"
    $(this).toggleClass "active"    
  
  $('a[href=#a1]').tab('show');
