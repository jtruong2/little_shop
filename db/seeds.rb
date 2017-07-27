Item.destroy_all
Category.destroy_all



CATEGORIES = ["pizza", "sandwiches", "drinks", "desserts"]
ITEMS = ["cheese", "meat-lovers", "veggie", "supreme", "pepperoni"]
IMAGES = ["cheese.png", "lovers.png", "veggie.png", "supreme.png", "pepperoni.png" ]

CATEGORIES.each do |name|
category = Category.create(name: name)
2.times do
  category.items.create(title: ITEMS.sample, price: "9.99", image: IMAGES.sample, description: "YUMMM")
 end
puts "________________Do I was going to say string inteporlation________________"
end

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
