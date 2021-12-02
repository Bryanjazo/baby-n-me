class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    if params[:room_id].present?
     
      stream_from "ChatRoom-#{(params[:room_id])}"
    end
  end

  def speak(data)
    sender    = get_sender(data)
    room_id   = data['room_id']
    message   = data['message']

    raise 'No room_id!' if room_id.blank?
    convo = get_convo(room_id) # A conversation is a room
    raise 'No conversation found!' if convo.blank?
    raise 'No message!' if message.blank?

    # adds the message sender to the conversation if not already included
    convo.users << sender unless convo.users.include?(sender)
    # saves the message and its data to the DB
    # Note: this does not broadcast to the clients yet!
    Message.create!(
      conversation: convo,
      sender: sender,
      content: message
    )
  end



  # def send_text(data)
  #   Api::V1::Message.create(body: data['body'] user_id: data['user_id'])

  #   ActionCable.server.broadcast('chat_messages_channel', 
  #   body: data['body'])
  # end


  # def self.all_messages(messages)
  #   ActionCable.server.broadcast('chat_messages_channel', history: messages)
  # end

  def get_convo(room_code)
    Conversation.find_by(room_code: room_code)
  end

  def get_sender
    User.find_by(uid: id)
  end
end
