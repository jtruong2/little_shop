Item.destroy_all
Category.destroy_all



CATEGORIES = ["pizza", "sandwiches", "drinks", "desserts"]
ITEMS = ["cheese", "meat-lovers", "veggie", "supreme", "pepperoni"]
IMAGES = ["cheese.png", "meat-lovers.png", "veggie.png", "supreme.png", "pepperoni.png" ]

CATEGORIES.each do |name|
category = Category.create(name: name)
2.times do
  category.items.create(title: ITEMS.sample, price: "9.99", image: IMAGES.sample, description: "I love cheese, especially edam taleggio. Cheese and wine manchego goat bavarian bergkase manchego cheese slices cheeseburger dolcelatte. Cheesecake st. agur blue cheese fondue pecorino rubber cheese fromage cheese and biscuits cheesy grin. Dolcelatte.")
 end
puts "________________Do I was going to say string inteporlation________________"
end

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
