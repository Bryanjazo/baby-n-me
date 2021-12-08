# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do



 sale = Api::V1::Selling.create(

        image_url: Faker::LoremFlickr.image,
        location: [Faker::Address.city, Faker::Address.state].join(' , '),
        description: Faker::Restaurant.description,
        title: [Faker::Address.city, Faker::Address.state].join(' , ') ,
        condition: "new",
        category: 'baby-clothes',
        brand: 'baby n me',
        size: "6 months",
        price: 19.99,
        user_id: 1
    )
    

end
