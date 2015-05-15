# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
init = ->
  $('#fab').find('a').on
    mouseenter: ->
      $('#fab').find('label').fadeIn 'fast'
    mouseleave: ->
      $('#fab').find('label').fadeOut 'fast'

$(init)
$(document).on 'page:load', init