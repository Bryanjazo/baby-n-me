class Api::V1::MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :chat_room_id, :sender_id, :username
end
