@reset_push =(current)->
  $('.current-push').each ->
    $(this).removeClass("current-push")

  current.addClass("current-push")

@push_create =(module,cur_id) ->
  builder = "<tr>"
  td = "<td>"
  td_end = "</td>"
  current_modal = $(".current-push").parents().eq(3)
  current_modal.find(".pushable").each ->
    if $(this).is("select")
      builder = builder + '<td data-id = "'+$(this).val()+'"">' + $(this).find('option:selected').text() + td_end
      remove_element_from_select($(this))
    else
      builder = builder + td + $(this).val() + td_end
    

  delete_cell = '<a class="btn btn-danger" data-confirm="Are you sure?" data-method="delete" data-remote="true" rel="nofollow" href="/admin/'+module+'/'+cur_id+'"><i class="fa fa-trash-o"></i></a>'
  edit_cell = '<a class="btn btn-warning" data-toggle="modal" data-target=#'+cur_id+'><i class="fa fa-edit"></i></a>'
  builder = builder + td + edit_cell+delete_cell + td_end + "</tr>"
  if $(".push-list").find('tr:first').length == 0
    $(".push-list").append builder
  else
    $(".push-list").find('tr:first').before builder
  current_modal.find(".close").click()



@push_update=(module,cur_id) ->
  builder = ""
  td = "<td>"
  td_end = "</td>"
  current_modal = $(".current-push").parents().eq(5)
  current_modal.find(".pushable").each ->
    if $(this).is("select")
      builder = builder + '<td data-id = "'+$(this).val()+'"">' + $(this).find('option:selected').text() + td_end
    else
      builder = builder + td + $(this).val() + td_end
    

  delete_cell = '<a class="btn btn-danger" data-confirm="Are you sure?" data-method="delete" data-remote="true" rel="nofollow" href="/admin/'+module+'/'+cur_id+'"><i class="fa fa-trash-o"></i></a>'
  edit_cell = '<a class="btn btn-warning" data-toggle="modal" data-target=#'+cur_id+'><i class="fa fa-edit"></i></a>'

  builder = builder
  current_modal.find(".close").click()
  current_modal.find('td').slice(1,3).remove()
  current_modal.find('td:first').after(builder)

@delete_push =(cur_id)->
  cur_id = "#"+cur_id
  console.log cur_id
  $parent = $(cur_id).parents().eq(1)

  #adds the element back to the list
  add_element_from_select($parent.find("td:first"),$('.unique-select'))

  $(cur_id).parents().eq(1).remove()



remove_element_from_select=(element)->
  element.find('option:selected').remove()

add_element_from_select=(element,list)->
  data_id = element.attr("data-id")
  data_val = element.html()
  list.append('<option value="'+data_id+'">'+data_val+'</option>')