class Api::V1::ChatRoom < ApplicationRecord
    has_many :messages
    has_and_belongs_to_many :users
end
