class Api::V1::Message < ApplicationRecord
    belongs_to :conversation
    belongs_to :sender, class_name: :User, foreign_key: "sender_id"
    validates :body, presence: :true

    # after_create_commit { Api::V1::MessageBroadcastJob.perform_later(self) }
end
