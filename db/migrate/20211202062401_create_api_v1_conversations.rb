class CreateApiV1Conversations < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_conversations do |t|
      t.integer :user_id
      t.timestamps
    end
  end
end
