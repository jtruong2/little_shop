ItemOrder.destroy_all
Order.destroy_all
Item.destroy_all
Category.destroy_all



# CATEGORIES = ["pizza", "sandwiches", "drinks", "desserts"]
# ITEMS = ["cheese", "meat-lovers", "veggie", "supreme", "pepperoni"]
# IMAGES = ["cheese.png", "meat-lovers.png", "veggie.png", "supreme.png", "pepperoni.png" ]

categ = Category.create!(name: "pizza")
name = "cheese"
a = categ.items.create(title: name, image: "#{name}.png",
                       description: "Spicy jalapeno bacon ipsum dolor amet burgdoggen landjaeger jowl sausage fatback tongue strip steak. Burgdoggen short loin prosciutto, porchetta tri-tip andouille meatloaf. Capicola hamburger shank tail flank ham hock jowl salami bacon bresaola meatball cow. Landjaeger pork loin fatback jowl tail burgdoggen andouille. Swine jerky kielbasa pig sausage drumstick cow doner.",
                       price: 9.99)
puts "#{a.title} #{categ.name} Created!"

name = "meat-lovers"
a = categ.items.create(title: name, image: "#{name}.png",
                       description: "Spicy jalapeno bacon ipsum dolor amet burgdoggen landjaeger jowl sausage fatback tongue strip steak. Burgdoggen short loin prosciutto, porchetta tri-tip andouille meatloaf. Capicola hamburger shank tail flank ham hock jowl salami bacon bresaola meatball cow. Landjaeger pork loin fatback jowl tail burgdoggen andouille. Swine jerky kielbasa pig sausage drumstick cow doner.",
                       price: 9.99)
puts "#{a.title} #{categ.name} Created!"

name = "veggie"
a = categ.items.create(title: name, image: "#{name}.png",
                       description: "Spicy jalapeno bacon ipsum dolor amet burgdoggen landjaeger jowl sausage fatback tongue strip steak. Burgdoggen short loin prosciutto, porchetta tri-tip andouille meatloaf. Capicola hamburger shank tail flank ham hock jowl salami bacon bresaola meatball cow. Landjaeger pork loin fatback jowl tail burgdoggen andouille. Swine jerky kielbasa pig sausage drumstick cow doner.",
                       price: 9.99)
puts "#{a.title} #{categ.name} Created!"

name = "pepperoni"
a = categ.items.create(title: name, image: "#{name}.png",
                        description: "Spicy jalapeno bacon ipsum dolor amet burgdoggen landjaeger jowl sausage fatback tongue strip steak. Burgdoggen short loin prosciutto, porchetta tri-tip andouille meatloaf. Capicola hamburger shank tail flank ham hock jowl salami bacon bresaola meatball cow. Landjaeger pork loin fatback jowl tail burgdoggen andouille. Swine jerky kielbasa pig sausage drumstick cow doner.",
                        price: 9.99)
puts "#{a.title} #{categ.name} Created!"

name = "supreme"
a = categ.items.create(title: name, image: "#{name}.png",
                        description: "Spicy jalapeno bacon ipsum dolor amet burgdoggen landjaeger jowl sausage fatback tongue strip steak. Burgdoggen short loin prosciutto, porchetta tri-tip andouille meatloaf. Capicola hamburger shank tail flank ham hock jowl salami bacon bresaola meatball cow. Landjaeger pork loin fatback jowl tail burgdoggen andouille. Swine jerky kielbasa pig sausage drumstick cow doner.",
                        price: 9.99)
puts "#{a.title} #{categ.name} Created!"

categ = Category.create!(name: "sandwiches")
name = "meatball"
a = categ.items.create(title: name, image: "#{name}.png",
                       description: "Spicy jalapeno bacon ipsum dolor amet burgdoggen landjaeger jowl sausage fatback tongue strip steak. Burgdoggen short loin prosciutto, porchetta tri-tip andouille meatloaf. Capicola hamburger shank tail flank ham hock jowl salami bacon bresaola meatball cow. Landjaeger pork loin fatback jowl tail burgdoggen andouille. Swine jerky kielbasa pig sausage drumstick cow doner.",
                       price: 6.99)
puts "#{a.title} #{categ.name} Created!"

name = "philly-cheese-steak"
a = categ.items.create(title: name, image: "#{name}.png",
                       description: "Spicy jalapeno bacon ipsum dolor amet burgdoggen landjaeger jowl sausage fatback tongue strip steak. Burgdoggen short loin prosciutto, porchetta tri-tip andouille meatloaf. Capicola hamburger shank tail flank ham hock jowl salami bacon bresaola meatball cow. Landjaeger pork loin fatback jowl tail burgdoggen andouille. Swine jerky kielbasa pig sausage drumstick cow doner.",
                       price: 6.99)
puts "#{a.title} #{categ.name} Created!"

name = "peanut-butter-and-jelly"
a = categ.items.create(title: name, image: "#{name}.png",
                       description: "Spicy jalapeno bacon ipsum dolor amet burgdoggen landjaeger jowl sausage fatback tongue strip steak. Burgdoggen short loin prosciutto, porchetta tri-tip andouille meatloaf. Capicola hamburger shank tail flank ham hock jowl salami bacon bresaola meatball cow. Landjaeger pork loin fatback jowl tail burgdoggen andouille. Swine jerky kielbasa pig sausage drumstick cow doner.",
                       price: 6.99)
puts "#{a.title} #{categ.name} Created!"

categ = Category.create!(name: "desserts")
name = "chocolate-chip-cookie"
a = categ.items.create(title: name, image: "#{name}.png",
                       description: "Spicy jalapeno bacon ipsum dolor amet burgdoggen landjaeger jowl sausage fatback tongue strip steak. Burgdoggen short loin prosciutto, porchetta tri-tip andouille meatloaf. Capicola hamburger shank tail flank ham hock jowl salami bacon bresaola meatball cow. Landjaeger pork loin fatback jowl tail burgdoggen andouille. Swine jerky kielbasa pig sausage drumstick cow doner.",
                       price: 3.99)
puts "#{a.title} #{categ.name} Created!"

name = "sundae"
a = categ.items.create(title: name, image: "#{name}.png",
                       description: "Spicy jalapeno bacon ipsum dolor amet burgdoggen landjaeger jowl sausage fatback tongue strip steak. Burgdoggen short loin prosciutto, porchetta tri-tip andouille meatloaf. Capicola hamburger shank tail flank ham hock jowl salami bacon bresaola meatball cow. Landjaeger pork loin fatback jowl tail burgdoggen andouille. Swine jerky kielbasa pig sausage drumstick cow doner.",
                       price: 3.99)
puts "#{a.title} #{categ.name} Created!"

name = "apple-pie"
a = categ.items.create(title: name, image: "#{name}.png",
                       description: "Spicy jalapeno bacon ipsum dolor amet burgdoggen landjaeger jowl sausage fatback tongue strip steak. Burgdoggen short loin prosciutto, porchetta tri-tip andouille meatloaf. Capicola hamburger shank tail flank ham hock jowl salami bacon bresaola meatball cow. Landjaeger pork loin fatback jowl tail burgdoggen andouille. Swine jerky kielbasa pig sausage drumstick cow doner.",
                       price: 3.99)
puts "#{a.title} #{categ.name} Created!"

categ = Category.create!(name: "drinks")
name = "coke"
a = categ.items.create(title: name, image: "#{name}.png",
                       description: "Spicy jalapeno bacon ipsum dolor amet burgdoggen landjaeger jowl sausage fatback tongue strip steak. Burgdoggen short loin prosciutto, porchetta tri-tip andouille meatloaf. Capicola hamburger shank tail flank ham hock jowl salami bacon bresaola meatball cow. Landjaeger pork loin fatback jowl tail burgdoggen andouille. Swine jerky kielbasa pig sausage drumstick cow doner.",
                       price: 1.99)
puts "#{a.title} #{categ.name} Created!"

name = "diet-coke"
a = categ.items.create(title: name, image: "#{name}.png",
                       description: "Spicy jalapeno bacon ipsum dolor amet burgdoggen landjaeger jowl sausage fatback tongue strip steak. Burgdoggen short loin prosciutto, porchetta tri-tip andouille meatloaf. Capicola hamburger shank tail flank ham hock jowl salami bacon bresaola meatball cow. Landjaeger pork loin fatback jowl tail burgdoggen andouille. Swine jerky kielbasa pig sausage drumstick cow doner.",
                       price: 1.99)
puts "#{a.title} #{categ.name} Created!"









#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
