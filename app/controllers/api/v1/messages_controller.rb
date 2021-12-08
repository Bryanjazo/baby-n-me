class Api::V1::MessagesController < ApplicationController
  def create
    message = Api::V1::Message.new(message_params)
    

    
    
    if message.save
       chat_room = Api::V1::ChatRoom.find(message.chat_room_id)
       
       ChatRoomChannel.broadcast_to(chat_room, message)
       # render json: message
    else
       render json: {errors: message.errors.full_messages}, status: 422
    end
end
private
def message_params
     params.require(:message).permit(:content, :chat_room_id, :sender_id, :username)
end
end
