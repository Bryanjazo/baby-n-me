class Api::V1::ChatRoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id
end
