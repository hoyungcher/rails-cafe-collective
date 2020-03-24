# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying seeds.."
User.destroy_all
Cafe.destroy_all

puts "Creating seeds..."
User.create(email: 'test@test.com', password: 'pass1234', owner: true, first_name: "bob", last_name: "marley")
Cafe.create(user: User.first, name: "great cafe", description: "very good cafe", neighbourhood: "Orchard", address: "singapore", city: "Singapore", category: "brightly lit", contact: "9999999")

# list of owners
User.create(email: 'test@test.com', password: 'pass1234', owner: true, first_name: "john", last_name: "smith")
User.create(email: 'test1@test.com', password: 'pass1234', owner: true, first_name: "james", last_name: "bourne")
User.create(email: 'test2@test.com', password: 'pass1234', owner: true, first_name: "jack", last_name: "jill")
User.create(email: 'test3@test.com', password: 'pass1234', owner: true, first_name: "jimmy", last_name: "fallon")
User.create(email: 'test4@test.com', password: 'pass1234', owner: true, first_name: "jill", last_name: "jack")

#list of cafes linked to owners
Cafe.create(user: User.first, name: "Awfully Chocolate", description: "very good cafe", neighbourhood: "Orchard", address: "11 singapore rd", city: "Singapore", category: "restaurant", contact: "98989898")
Cafe.create(user: User.find(User.first.id + 1), name: "Simply Wraps", description: "nice cafe that sells wraps", neighbourhood: "Bukit Timah", address: "12 singapore rd", city: "Singapore", category: "restaurant", contact: "99999999")
Cafe.create(user: User.find(User.first.id + 2), name: "The brunch place", description: "great brunch options for brunch lovers", neighbourhood: "Tiong Bahru", address: "13 singapore rd", city: "Singapore", category: "bar", contact: "99999997")
Cafe.create(user: User.find(User.first.id + 3), name: "Revelry", description: "great place for food", neighbourhood: "Redhill", address: "14 singapore rd", city: "Singapore", category: "cafe", contact: "99999998")
Cafe.create(user: User.find(User.first.id + 4), name: "Great Korean Cafe", description: "nice korean food and stuff", neighbourhood: "Changi Airport", address: "15 singapore rd", city: "Singapore", category: "cafe", contact: "99999996")

puts "Seeds done!"
