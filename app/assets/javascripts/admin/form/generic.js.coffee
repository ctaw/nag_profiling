$(document).on "click", '.submit-btn', (event) ->
  event.preventDefault()
  if is_not_blank('.required')

    if $('.fileinput-filename').lengt > 0 && $('.fileinput-filename').html().trim() == ""
       $('.delete_field').val 1
    
    #$('#overlay').css("z-index",99999).removeClass("hidden");
    $('form').submit()





$(document).on "change", ".answer-group", (event) ->
  event.preventDefault()

  cur_index = $(this).index(".answer-group")
  #ensures that only one checkbox is checked
  $(this).parents().eq(4).find(".answer-group").each (index) ->
    prev_index = $(this).index(".answer-group")
    unless prev_index is cur_index
      $(this).attr "checked", false


$(document).on "click", '.submit-summernote', (event) ->
  event.preventDefault()

  if is_not_blank('.required') 
    $('.note-editable').each ->
      $(this).parents().eq(1).find('textarea').val($(this).html())

    $('#overlay').css("z-index",99999).removeClass("hidden");
    $('form').eq(0).submit()


$(document).on "click", '.submit-modal-btn', (event) ->
  event.preventDefault()
  $parent = $(this).parents().eq(2)
  if is_not_blank($parent.find('.required')) 
    $('#overlay').css("z-index",99999).removeClass("hidden");
    $parent.find('form').submit()