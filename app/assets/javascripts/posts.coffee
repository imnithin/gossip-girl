# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
  PrivatePub.subscribe "/posts", (data, channel) ->    
    $('#notification').append("<a href=/posts/"+data.post._id.$oid+">"+data.post.name+"</a>"+"</br>");
