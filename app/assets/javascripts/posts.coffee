# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
  PrivatePub.subscribe "/posts", (data, channel) ->   
  	if data.post.method == "create"
  		$('#notification').append("<a href=/posts/"+data.post._id.$oid+">"+data.post.name+"</a>"+" post created by : "+data.post.user_email+"</br>");
  	else
  		if data.post.name
  			$('#notification').append("<a href=/posts/"+data.post.id.$oid+">"+data.post.name[0]+"</a>"+" changed to : "+data.post.name[1]+"</br>");
  		if data.post.description
  			$('#notification').append("<a href=/posts/"+data.post.id.$oid+">"+data.post.description[0]+"</a>"+" changed to : "+data.post.description[1]+"</br>");
  			
# todo: refactor and post table attributes could be added in further stage so it would be efficient to do it dynamically.