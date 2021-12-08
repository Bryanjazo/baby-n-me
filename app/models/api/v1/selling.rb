class Api::V1::Selling < ApplicationRecord



    belongs_to :user

   
    validates :image_url, {
        presence: true
      }

   
    # t.string :image_url
    # t.string :location
    # t.text :description
    # t.string :title
    # t.string :condition
    # t.string :category 
    # t.string :brand
    # t.string :size 
    # t.integer :price
    # t.integer :user_id
end
