#= require jquery
#= require bootstrap

$ ->
  $('#openproject').show()
  $('#visualization').hide()
  $('#settings').hide()

$('#openproject .btn').click ->
  $('#openproject').hide()
  $('#visualization').show()
  return false

$('#visualization .settings').click ->
  $('#visualization').hide()
  $('#settings').show()
  return false

$('#visualization .change-project').click ->
  $('#visualization').hide()
  $('#openproject').show()
  return false

$('#settings .btn').click ->
  $('#settings').hide()
  $('#visualization').show()
  return false
