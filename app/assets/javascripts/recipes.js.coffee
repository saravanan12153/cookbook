# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
init = ->

  $('#recipe_picture').bind 'change', ->
    sizeMb = this.files[0].size / 1024 / 1024

    alert('The image is too large; maximum file size is 5MB.') if sizeMb > 5