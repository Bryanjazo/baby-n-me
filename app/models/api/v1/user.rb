class Api::V1::User < ApplicationRecord
    validates :username, presence: :true, length: {minimum: 3, maximum: 15}
    has_and_belongs_to_many :chat_rooms, dependent: :destroy
    has_many :rates
    has_many :sellings


end
