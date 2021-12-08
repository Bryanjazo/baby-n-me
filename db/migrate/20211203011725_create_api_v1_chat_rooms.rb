class CreateApiV1ChatRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_chat_rooms do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
