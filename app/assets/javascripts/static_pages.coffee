# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$('#myTab a').click (e) ->
  e.preventDefault()
  $(this).tab 'show'
  return
$('ul.nav-tabs > li > a').on 'shown.bs.tab', (e) ->
  id = $(e.target).attr('href').substr(1)
  window.location.hash = id
  return
hash = window.location.hash
$('#myTab a[href="' + hash + '"]').tab 'show'
