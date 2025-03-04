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

testuser1 = User.create!(username: "test1", email: "test1@gmail.com", password: "prestokitchen")
testuser2 = User.create!(username: "test2", email: "test2@gmail.com", password: "prestokitchen")
testuser3 = User.create!(username: "test3", email: "test3@gmail.com", password: "prestokitchen")
testuser4 = User.create!(username: "test4", email: "test4@gmail.com", password: "prestokitchen")
testuser5 = User.create!(username: "test5", email: "test5@gmail.com", password: "prestokitchen")

puts "Created my five users"

photo1 = File.open("app/assets/images/fondue_fromage.png")
appliance1 = Appliance.new(name: "Fondue Party", description: "Stinking bishop cauliflower cheese pepper jack. Red leicester goat cheese triangles roquefort pepper jack dolcelatte fromage cheeseburger. Pecorino chalk and cheese fondue bocconcini the big cheese swiss goat cheese triangles. Airedale dolcelatte who moved my cheese.", price: 20, user: testuser1, capacity: 6, city: "Paris")
appliance1.photo.attach(io: photo1, filename: "fondue_fromage.png", content_type: "image/png")
appliance1.save!

puts "Created appliance 1"

photo2 = File.open("app/assets/images/raclette_4.jpg")
appliance2 = Appliance.new(name: "Raclette for 4", description:"Blue castello port-salut port-salut. Blue castello rubber cheese caerphilly emmental airedale stilton when the cheese comes out everybody's happy the big cheese. Cheese and biscuits mascarpone melted cheese squirty cheese cheddar cheese slices cheese triangles cheddar. Cottage cheese red leicester.", price: 15, user: testuser2, capacity: 4, city: "Chambéry")
appliance2.photo.attach(io: photo2, filename: "raclette_4.jpg", content_type: "image/jpg")
appliance2.save!

puts "Created appliance 2"

photo3 = File.open("app/assets/images/pierrade.jpeg")
appliance3 = Appliance.create!(name: "Pierrade c'est chaud!", description: "Pork chop eu prosciutto pork belly buffalo cillum do aliqua veniam. Beef elit venison tempor deserunt strip steak fugiat beef ribs ground round aute pig. Porchetta turducken irure shank sed tempor frankfurter boudin ut andouille qui pariatur turkey brisket. Venison consequat alcatra, strip steak beef ribs meatball eiusmod meatloaf in esse turkey dolore cillum.", price: 30, user: testuser3, capacity: 8 , city: "Marseille")
appliance3.photo.attach(io: photo3, filename: "pierrade.jpeg", content_type: "image/jpeg")
appliance3.save!

puts "Created appliance 3"

photo4 = File.open("app/assets/images/fondue_chocolat.jpg")
appliance4 = Appliance.create!(name: "Je fonds pour la fondue chocolat", description: "Chocolate donut lollipop icing pudding pastry cheesecake danish tart. Donut muffin donut gummi bears chocolate bar. Caramels oat cake marshmallow candy macaroon. Cookie icing wafer biscuit dessert jelly beans.", price: 30, user: testuser4, capacity: 6, city: "Lille")
appliance4.photo.attach(io: photo4, filename: "fondue_chocolat.jpg", content_type: "image/jpg")
appliance4.save!

puts "Created appliance 4"

photo5 = File.open("app/assets/images/raclette_8.jpg")
appliance5 = Appliance.create!(name: "Raaaaaaaaaclette !!!", description: "Cheese strings who moved my cheese stilton. Everyone loves who moved my cheese halloumi cheese and wine cheesy grin danish fontina cauliflower cheese cheese triangles. Paneer macaroni cheese say cheese mascarpone feta ricotta cheese slices camembert de normandie. Hard cheese taleggio when the cheese comes out everybody's happy fromage fromage who moved my cheese port-salut cut the cheese. Melted cheese.", price: 25, user: testuser5, capacity: 8, city: "Villejuif")
appliance5.photo.attach(io: photo5, filename: "raclette_8.jpg", content_type: "image/jpg")
appliance5.save!

puts "Created my five appliances"
