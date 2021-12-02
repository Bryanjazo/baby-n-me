class Api::V1::Message < ApplicationRecord
    validates :body, presence: :true
end
