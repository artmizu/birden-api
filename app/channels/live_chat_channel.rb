# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class LiveChatChannel < ApplicationCable::Channel
  def subscribed
    stream_for 'live_chat'
    
  end

  def receive(data)
  	message = data["text"]
  	user = current_user.email
  	LiveChatChannel.broadcast_to(
  		'live_chat', 
		title: message,
		user: user
  	)
  end

  def unsubscribed
    current_user.disappear
  end

end
