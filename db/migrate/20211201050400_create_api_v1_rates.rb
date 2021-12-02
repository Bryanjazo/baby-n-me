class CreateApiV1Rates < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_rates do |t|
      t.integer :rate, limit: 5
      t.text :comment
      t.integer :user_id
      
      t.timestamps
    end
  end
end
