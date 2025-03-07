# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

User.destroy_all
Appliance.destroy_all

puts "Cleaned my database"

testuser1 = User.create!(username: "Elisa98", email: "test1@gmail.com", password: "prestokitchen")
testuser2 = User.create!(username: "Frankie1985", email: "test2@gmail.com", password: "prestokitchen")
testuser3 = User.create!(username: "Adeline GRB", email: "test3@gmail.com", password: "prestokitchen")
testuser4 = User.create!(username: "Batmanne", email: "test4@gmail.com", password: "prestokitchen")
testuser5 = User.create!(username: "Thomas Dutronc", email: "test5@gmail.com", password: "prestokitchen")
testuser6 = User.create!(username: "Julia K.", email: "test6@gmail.com", password: "prestokitchen")

puts "Created my five users"

photo1 = File.open("app/assets/images/fondue_fromage.png")
appliance1 = Appliance.new(name: "Fondue Party", description: "Stinking bishop cauliflower cheese pepper jack. Red leicester goat cheese triangles roquefort pepper jack dolcelatte fromage cheeseburger. Pecorino chalk and cheese fondue bocconcini the big cheese swiss goat cheese triangles. Airedale dolcelatte who moved my cheese.", price: 20, user: testuser1, capacity: 6, city: "Paris", address: "Paris")
appliance1.photo.attach(io: photo1, filename: "fondue_fromage.png", content_type: "image/png")
appliance1.save!

puts "Created appliance 1"

photo2 = File.open("app/assets/images/raclette_4.jpg")
appliance2 = Appliance.new(name: "Raclette for 4", description:"Blue castello port-salut port-salut. Blue castello rubber cheese caerphilly emmental airedale stilton when the cheese comes out everybody's happy the big cheese. Cheese and biscuits mascarpone melted cheese squirty cheese cheddar cheese slices cheese triangles cheddar. Cottage cheese red leicester.", price: 15, user: testuser2, capacity: 4, city: "Gentilly", address: "Gentilly")
appliance2.photo.attach(io: photo2, filename: "raclette_4.jpg", content_type: "image/jpg")
appliance2.save!

puts "Created appliance 2"

photo3 = File.open("app/assets/images/pierrade.jpeg")
appliance3 = Appliance.create!(name: "Pierrade c'est chaud!", description: "Pork chop eu prosciutto pork belly buffalo cillum do aliqua veniam. Beef elit venison tempor deserunt strip steak fugiat beef ribs ground round aute pig. Porchetta turducken irure shank sed tempor frankfurter boudin ut andouille qui pariatur turkey brisket. Venison consequat alcatra, strip steak beef ribs meatball eiusmod meatloaf in esse turkey dolore cillum.", price: 30, user: testuser3, capacity: 8 , city: "Marseille", address: "Marseille")
appliance3.photo.attach(io: photo3, filename: "pierrade.jpeg", content_type: "image/jpeg")
appliance3.save!

puts "Created appliance 3"

photo4 = File.open("app/assets/images/fondue_chocolat.jpg")
appliance4 = Appliance.create!(name: "Je fonds pour la fondue chocolat", description: "Chocolate donut lollipop icing pudding pastry cheesecake danish tart. Donut muffin donut gummi bears chocolate bar. Caramels oat cake marshmallow candy macaroon. Cookie icing wafer biscuit dessert jelly beans.", price: 30, user: testuser4, capacity: 6, city: "Lille", address: "Lille")
appliance4.photo.attach(io: photo4, filename: "fondue_chocolat.jpg", content_type: "image/jpg")
appliance4.save!

puts "Created appliance 4"

photo5 = File.open("app/assets/images/raclette_8.jpg")
appliance5 = Appliance.create!(name: "Raaaaaaaaaclette !!!", description: "Cheese strings who moved my cheese stilton. Everyone loves raclette who moved my cheese halloumi cheese and wine cheesy grin danish fontina cauliflower cheese cheese triangles. Paneer macaroni cheese say cheese mascarpone feta ricotta cheese slices camembert de normandie. Hard cheese taleggio when the cheese comes out everybody's happy fromage fromage who moved my cheese port-salut cut the cheese. Melted cheese.", price: 25, user: testuser5, capacity: 8, city:"Villejuif", address: "Villejuif")
appliance5.photo.attach(io: photo5, filename: "raclette_8.jpg", content_type: "image/jpg")
appliance5.save!

puts "Created appliance 5"

photo6 = File.open("app/assets/images/raclette_pierrade.jpg")
appliance6 = Appliance.create!(name: "Raclette et pierrade", description: "Cream cheese queso blue castello. Stinking bishop danish fontina swiss mozzarella st. agur blue cheese when the cheese comes out everybody's happy pecorino bocconcini. Hard cheese cut the cheese feta bocconcini blue castello fon say cheese babybel. Mozzarella.", price: 25, user: testuser5, capacity: 10, city:"Orsay", address: "Orsay")
appliance6.photo.attach(io: photo6, filename: "raclette_pierrade.jpg", content_type: "image/jpg")
appliance6.save!

puts "Created appliance 6"

photo7 = File.open("app/assets/images/choco_fondue.jpg")
appliance7 = Appliance.create!(name: "Fondue au chocolat", description: "Cheeseburger manchego gouda. Who moved my cheese who moved my cheese boursin roquefort ricotta caerphilly cheese and biscuits mascarpone. Cottage cheese rubber cheese red leicester rubber cheese bavarian bergkase halloumi mozzarella bocconcini. Dolcelatte.", price: 19, user: testuser1, capacity: 8, city: "Kremlin-Bicêtre", address: "Kremlin-Bicêtre")
appliance7.photo.attach(io: photo7, filename: "choco_fondue.jpg", content_type: "image/jpg")
appliance7.save!

puts "Created appliance 7"

photo8 = File.open("app/assets/images/mixer_1.jpg")
appliance8 = Appliance.create!(name: "Mixeur pro", description: "I'm baby tacos you probably haven't heard of them williamsburg kale chips, normcore street art coloring book. Tacos Brooklyn af, poutine tumblr pitchfork keffiyeh. Photo booth hella glossier fam offal. Vibecession asymmetrical vape flexitarian direct trade. Flannel knausgaard tousled street art celiac. Tbh stumptown poke, you probably haven't heard of them hoodie tacos vaporware 8-bit adaptogen.", price: 30, user: testuser2, capacity: 1, city: "Gentilly", address: "Gentilly")
appliance8.photo.attach(io: photo8, filename: "mixer_1.jpg", content_type: "image/jpg")
appliance8.save!

puts "Created appliance 8"

photo9 = File.open("app/assets/images/mixer_2.jpg")
appliance9 = Appliance.create!(name: "Mixeur Kitchenaid", description: "Try-hard post-ironic XOXO yuccie paleo austin JOMO, offal skateboard blue bottle heirloom meh hashtag polaroid normcore. Af edison bulb gatekeep VHS cliche cornhole mixtape bodega boys. Coloring book cardigan butcher DSA leggings, subway tile mukbang.", price: 15, user: testuser3, capacity: 1, city:"Paris", address: "Paris")
appliance9.photo.attach(io: photo9, filename: "mixer_2.jpg", content_type: "image/jpg")
appliance9.save!

puts "Created appliance 9"

photo10 = File.open("app/assets/images/mixer_3.jpeg")
appliance10 = Appliance.create!(name: "Fouette Fouette", description: "Cardigan stumptown tonx, woke four loko meditation twee. Flexitarian fit 90's JOMO ennui neutra letterpress woke lo-fi put a bird on it. Woke cloud bread tumblr killme edison bulb mixtape mumblecore shoreditch Brooklyn photo booth.", price: 10, user: testuser4, capacity: 1, city: "Bourg la Reine", address: "Bourg la Reine")
appliance10.photo.attach(io: photo10, filename: "mixer_3.jpeg", content_type: "image/jpg")
appliance10.save!

puts "Created appliance 10"

photo11 = File.open("app/assets/images/fondue_11.jpg")
appliance11 = Appliance.create!(name: "Appareil à fondue", description: "Flexitarian fit 90's JOMO ennui neutra letterpress woke lo-fi put a bird on it. Woke cloud bread tumblr fondue.", price: 15, user: testuser5, capacity: 6, city:"Orsay", address: "Orsay")
appliance11.photo.attach(io: photo11, filename: "fondue_11.jpg", content_type: "image/jpg")
appliance11.save!

puts "Created appliance 11"

photo12 = File.open("app/assets/images/fondue_12.jpg")
appliance12 = Appliance.create!(name: "Hot pot!", description: "Street art sriracha cardigan pop-up. Ennui prism jawn literally distillery vinyl crucifix af echo park quinoa slow-carb biodiesel vibecession keffiyeh. Artisan vexillologist tattooed sartorial. Authentic squid ethical, shabby chic meh williamsburg YOLO cliche viral edison bulb letterpress. Poutine viral 8-bit gastropub pinterest. Intelligentsia vice distillery salvia, mustache synth VHS banh mi yuccie adaptogen la croix.", price: 20, user: testuser3, capacity: 10, city: "Sceaux", address: "Sceaux")
appliance12.photo.attach(io: photo12, filename: "fondue_12.jpg", content_type: "image/jpg")
appliance12.save!

puts "Created appliance 12"

photo13 = File.open("app/assets/images/raclette_13.jpg")
appliance13 = Appliance.create!(name: "Raclette orgy", description: "You probably haven't heard of them selfies mukbang shabby chic marfa. Hella hashtag banh mi tacos, typewriter flannel meditation kombucha health goth pork belly palo santo bespoke pitchfork master cleanse. Coloring book kogi sustainable palo santo street art jawn. Chambray shabby chic biodiesel deep v coloring book health goth DIY fingerstache copper mug neutra.", price: 20, user: testuser4, capacity: 8, city:"Paris", address: "Paris")
appliance13.photo.attach(io: photo13, filename: "raclette_13.jpg", content_type: "image/jpg")
appliance13.save!

puts "Created appliance 13"

photo14 = File.open("app/assets/images/raclette_14.jpg")
appliance14 = Appliance.create!(name: "Raclette orgy", description: "I'm baby cillum sunt artisan dolore. Veniam DIY grailed magna meh praxis, edison bulb plaid cornhole culpa asymmetrical qui poke vibecession pabst. Quinoa sustainable bushwick enamel pin biodiesel trust fund, man bun beard.", price: 20, user: testuser2, capacity: 12, city: "Gentilly", address: "Gentilly")
appliance14.photo.attach(io: photo14, filename: "raclette_14.jpg", content_type: "image/jpg")
appliance14.save!

puts "Created appliance 14"

photo15 = File.open("app/assets/images/sousvide_15.jpg")
appliance15 = Appliance.create!(name: "Sousvide like a boss", description: "Mollit dolore hexagon small batch ascot air plant, reprehenderit butcher consequat sriracha marxism adaptogen williamsburg iPhone. Freegan try-hard officia non. Kale chips paleo +1, mukbang tempor vape heirloom. Sustainable sunt vice leggings, four dollar toast chillwave voluptate 8-bit. Chia salvia minim dolor asymmetrical.", price: 25, user: testuser3, capacity: 2, city: "Paris", address: "Paris")
appliance15.photo.attach(io: photo15, filename: "sousvide_15.jpg", content_type: "image/jpg")
appliance15.save!

puts "Created appliance 15"
