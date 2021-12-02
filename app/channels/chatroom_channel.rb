class ChatroomChannel < ApplicationCable::Channel
  def subscribed
     stream_from "chatroom_channel"
     ChatroomChannel.all_messages(Api::V1::Message.all.order(id: :desc).limit(30).reorder(id: :asc))
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end


  def send_text(data)
    Api::V1::Message.create(body: data['body'] user_id: data['user_id'])

    ActionCable.server.broadcast('chat_messages_channel', 
    body: data['body'])
  end


  def self.all_messages(messages)
    ActionCable.server.broadcast('chat_messages_channel', history: messages)
  end
end
