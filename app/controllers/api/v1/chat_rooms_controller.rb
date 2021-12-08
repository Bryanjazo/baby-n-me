class Api::V1::ChatRoomsController < ApplicationController
  def index

    chat_rooms = Api::V1::ChatRoom.all
    render json: chat_rooms
end

def create
    chat_room = Api::V1::ChatRoom.new(chat_room_params)
    

    if chat_room.save
         render json: chat_room.to_json(include: [:messages])
    else
         render json: {errors: game.errors.full_messages}, status: 422
    end
end

def show

    chat_room = Api::V1::ChatRoom.find(params[:id])
  
    render json: chat_room.messages 
end
private
def chat_room_params
    params.require(:chat_room).permit(:name, :user_id)
end
end
