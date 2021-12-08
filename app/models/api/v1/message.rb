class Api::V1::Message < ApplicationRecord
    belongs_to :chat_room
    belongs_to :sender, class_name: :User, foreign_key: 'sender_id'
end
