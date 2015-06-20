# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(
  email: "jj@farm.com",
  first_name: "Jack",
  last_name: "McDonalds",
  merchant_id: 0
)

Product.create(
  title: "German Red Pied cow",
  description: "Organic grass fed beef.",
  image: File.new("#{Rails.root}/app/assets/images/seed-products/cow-Gelbvieh.jpg"),
  items_available: 20,
  available_until: Date.today+14.days,
  user_id: user.id

)

Product.create(
  title: "Blaarkop",
  description: "Dutch beef by the kilo.",
  image: File.new("#{Rails.root}/app/assets/images/seed-products/cow-Blonde_Aquitaine.jpg"),
  items_available: 400,
  available_until: Date.today+5.days,
  user_id: user.id
)


Product.create(
  title: "Onions",
  description: "Organic white onions.",
  image: File.new("#{Rails.root}/app/assets/images/seed-products/onions.jpg"),
  items_available: 50,
  available_until: Date.today+21.days,
  user_id: user.id
)
