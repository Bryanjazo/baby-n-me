class CreateApiV1Messages < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_messages do |t|
      t.string :content
      t.string :username
      t.integer :sender_id
      t.string :chat_room_id
    

      t.timestamps
    end
  end
end
