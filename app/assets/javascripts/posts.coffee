# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  PrivatePub.subscribe "/posts", (data, channel) ->
    $('table#posts tbody').append(data.insert_record)
    if data.post.method == "create"
      $('#notification').append("<a href=/posts/"+data.post._id.$oid+">"+data.post.title+"</a>"+" post created by : "+data.post.user_email+"</br>")
    else
      if data.post.title
        $('#notification').append("<a href=/posts/"+data.post.id.$oid+">"+data.post.title[0]+"</a>"+" changed to : "+data.post.title[1]+"</br>")
      if data.post.description
        $('#notification').append("<a href=/posts/"+data.post.id.$oid+">"+data.post.description[0]+"</a>"+" changed to : "+data.post.description[1]+"</br>")
