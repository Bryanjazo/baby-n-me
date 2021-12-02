class UserSerializer < ActiveModel::Serializer
  attributes :id, :username 
  has_many :messages, serializer: MessageSerializer, include_nested_association: true 
  has_many :channels, serializer: ChannelSerializer
end
