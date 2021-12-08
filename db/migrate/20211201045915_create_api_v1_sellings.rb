class CreateApiV1Sellings < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_sellings do |t|

      t.string :location
      t.text :description
      t.string :title
      t.string :condition
      t.string :category 
      t.string :brand
      t.string :size 
      t.integer :price
      t.string :image_url
      t.integer :user_id

   
      t.timestamps
    end
  end
end
