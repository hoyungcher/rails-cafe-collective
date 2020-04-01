# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Destroying seeds.."
MenuItem.destroy_all
Order.destroy_all
Review.destroy_all
CafeTag.destroy_all
Tag.destroy_all
User.destroy_all
Cafe.destroy_all


puts "Creating seeds..."


puts "Creating users..."
# list of owner users
User.create(email: 'user1@gmail.com', password: 'pass1234', owner: true, first_name: "John", last_name: "Smith")
User.create(email: 'user2@gmail.com', password: 'pass1234', owner: true, first_name: "Jason", last_name: "Bourne")
User.create(email: 'user3@gmail.com', password: 'pass1234', owner: true, first_name: "Ellen", last_name: "Degeneres")
User.create(email: 'user4@gmail.com', password: 'pass1234', owner: true, first_name: "Serena", last_name: "Williams")
User.create(email: 'user5@gmail.com', password: 'pass1234', owner: true, first_name: "Jack", last_name: "Johnson")
User.create(email: 'user6@gmail.com', password: 'pass1234', owner: true, first_name: "Beyonce", last_name: "Knowles")
User.create(email: 'user7@gmail.com', password: 'pass1234', owner: true, first_name: "Michael", last_name: "Jackson")
User.create(email: 'user8@gmail.com', password: 'pass1234', owner: true, first_name: "Rick", last_name: "Morty")
User.create(email: 'user9@gmail.com', password: 'pass1234', owner: true, first_name: "Derek", last_name: "Shepherd")
User.create(email: 'user10@gmail.com', password: 'pass1234', owner: true, first_name: "Meredith", last_name: "Grey")

20.times do |index|
  character = Faker::Name.name.split(" ")
  User.create!(email: "user#{21 + index}@gmail.com", password: 'pass1234', owner: true, first_name: character[0], last_name: character[1])
end

# list of non-owner users
User.create(email: 'user11@gmail.com', password: 'pass1234', owner: false, first_name: "Will", last_name: "Smith")
User.create(email: 'user12@gmail.com', password: 'pass1234', owner: false, first_name: "Phoebe", last_name: "Buffay")
User.create(email: 'user13@gmail.com', password: 'pass1234', owner: false, first_name: "Jennifer", last_name: "Lopez")
User.create(email: 'user14@gmail.com', password: 'pass1234', owner: false, first_name: "Trevor", last_name: "Noah")
User.create(email: 'user15@gmail.com', password: 'pass1234', owner: false, first_name: "Justin", last_name: "Bieber")
User.create(email: 'user16@gmail.com', password: 'pass1234', owner: false, first_name: "Selena", last_name: "Gomez")
User.create(email: 'user17@gmail.com', password: 'pass1234', owner: false, first_name: "Paul", last_name: "McCartney")
User.create(email: 'user18@gmail.com', password: 'pass1234', owner: false, first_name: "Chris", last_name: "Paul")
User.create(email: 'user19@gmail.com', password: 'pass1234', owner: false, first_name: "Kobe", last_name: "Bryant")
User.create(email: 'user20@gmail.com', password: 'pass1234', owner: false, first_name: "Larry", last_name: "Bird")


puts "Creating cafes..."
#list of cafes linked to owner users
Cafe.create(user: User.first, name: "The Clue-less Goat", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Novena", address: "189 Thomson Rd, Singapore", city: "Singapore", category: "cafe", contact: "8283 0885")
Cafe.create(user: User.find(User.first.id + 1), name: "Craftsmen Coffee", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Novena", address: "173 Thomson Rd, Singapore", city: "Singapore", category: "cafe", contact: "9658 0769")
Cafe.create(user: User.find(User.first.id + 2), name: "Kyushu Pancake Cafe", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Novena", address: "275 Thomson Rd, Singapore", city: "Singapore", category: "cafe", contact: "6352 6265")
Cafe.create(user: User.find(User.first.id + 3), name: "Da Luca", description: "Inspired by the dining cultures of the East and West, we combine creative techniques of new age cooking with premium ingredients and edgy presentation.", neighbourhood: "Novena", address: "1 Goldhill Plaza, Singapore 308899", city: "Singapore", category: "restaurant", contact: "6258 4846")
Cafe.create(user: User.find(User.first.id + 4), name: "Urbana Rooftop Bar", description: "Our stunningly appointed cocktail bar serves fine wines, handcrafted cocktails and sweeping views of the city.", neighbourhood: "Novena", address: "99 Irrawaddy Rd, Singapore 329568", city: "Singapore", category: "bar", contact: "6378 2060")
Cafe.create(user: User.find(User.first.id + 5), name: "Two Hana", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Tampines", address: "2 Tampines Central 5, 529509", city: "Singapore", category: "cafe", contact: "6260 4321")
Cafe.create(user: User.find(User.first.id + 6), name: "MO Cafe", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Tampines", address: "50 Tampines North Drive 2, Singapore 528766", city: "Singapore", category: "cafe", contact: "6382 2937")
Cafe.create(user: User.find(User.first.id + 7), name: "Three's A Crowd", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Tampines", address: "802 Tampines Ave 4, Singapore 520802", city: "Singapore", category: "cafe", contact: "6702 0700")
Cafe.create(user: User.find(User.first.id + 8), name: "Tipsy Penguin", description: "restaurantdesc", neighbourhood: "Tampines", address: "300 Tampines Ave 5, Singapore 529653", city: "Singapore", category: "restaurant", contact: "8223 2983")
Cafe.create(user: User.find(User.first.id + 9), name: "Five Izakaya", description: "Our stunningly appointed cocktail bar serves fine wines, handcrafted cocktails and sweeping views of the city.", neighbourhood: "Tampines", address: "5 Changi Business Park Central 1, Singapore 486038", city: "Singapore", category: "bar", contact: "6604 8255")

Cafe.create(user: User.find(User.first.id + 20), name: "Group Therapy Coffee", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Katong", address: "30 E Coast Rd, 428751", city: "Singapore", category: "cafe", contact: "7369 0885")
Cafe.create(user: User.find(User.first.id + 21), name: "2Six Cafe", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Katong", address: "88 E Coast Rd, Singapore 423371", city: "Singapore", category: "cafe", contact: "6247 7548")
Cafe.create(user: User.find(User.first.id + 22), name: "Rabbit Carrot Gun", description: "Inspired by the dining cultures of the East and West, we combine creative techniques of new age cooking with premium ingredients and edgy presentation.", neighbourhood: "Katong", address: "49 E Coast Rd, Singapore 428768", city: "Singapore", category: "restaurant", contact: "6348 8568")
Cafe.create(user: User.find(User.first.id + 23), name: "Platypus Cantina", description: "Inspired by the dining cultures of the East and West, we combine creative techniques of new age cooking with premium ingredients and edgy presentation.", neighbourhood: "Katong", address: "171 E Coast Rd, Singapore 428877", city: "Singapore", category: "restaurant", contact: "6344 0166")
Cafe.create(user: User.find(User.first.id + 24), name: "The Trenchard Arms", description: "Our stunningly appointed cocktail bar serves fine wines, handcrafted cocktails and sweeping views of the city.", neighbourhood: "Katong", address: "47 E Coast Rd, Singapore 428767", city: "Singapore", category: "bar", contact: "6348 8568")
Cafe.create(user: User.find(User.first.id + 25), name: "Poppy Pops", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Jurong East", address: "50 Jurong Gateway Rd, Singapore 608549", city: "Singapore", category: "cafe", contact: "6262 0339")
Cafe.create(user: User.find(User.first.id + 26), name: "Time Table Cafe", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Jurong East", address: "Jurong West Street 41, Singapore 640456", city: "Singapore", category: "cafe", contact: "6566 5088")
Cafe.create(user: User.find(User.first.id + 27), name: "PocoLoco", description: "Inspired by the dining cultures of the East and West, we combine creative techniques of new age cooking with premium ingredients and edgy presentation.", neighbourhood: "Jurong East", address: "21 Jurong Town Hall Rd, Singapore 609433", city: "Singapore", category: "restaurant", contact: "8866 4646")
Cafe.create(user: User.find(User.first.id + 28), name: "The Good Trio", description: "Inspired by the dining cultures of the East and West, we combine creative techniques of new age cooking with premium ingredients and edgy presentation.", neighbourhood: "Jurong East", address: "Jurong East Central 1, Singapore 609731", city: "Singapore", category: "restaurant", contact: "6694 1897")
Cafe.create(user: User.find(User.first.id + 29), name: "Faber Valley Pub", description: "Our stunningly appointed cocktail bar serves fine wines, handcrafted cocktails and sweeping views of the city.", neighbourhood: "Jurong East", address: "114 Faber Dr, Singapore 129426", city: "Singapore", category: "bar", contact: "6778 7101")

Cafe.create(user: User.find(User.first.id + 30), name: "Oriole Coffee", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Orchard", address: "96 Somerset Rd, 238163", city: "Singapore", category: "cafe", contact: "6238 8348")
Cafe.create(user: User.find(User.first.id + 31), name: "dal.komm COFFEE", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Orchard", address: "176 Orchard Road, 238843", city: "Singapore", category: "cafe", contact: "7438 0769")
Cafe.create(user: User.find(User.first.id + 32), name: "Baker's Brew", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Orchard", address: "290 Orchard Rd, Singapore 238859", city: "Singapore", category: "cafe", contact: "6909 0669")
Cafe.create(user: User.find(User.first.id + 33), name: "Som Tam", description: "Inspired by the dining cultures of the East and West, we combine creative techniques of new age cooking with premium ingredients and edgy presentation.", neighbourhood: "Orchard", address: "181 Orchard Rd, 238896", city: "Singapore", category: "restaurant", contact: "6238 6872")
Cafe.create(user: User.find(User.first.id + 34), name: "The Other Room", description: "Our stunningly appointed cocktail bar serves fine wines, handcrafted cocktails and sweeping views of the city.", neighbourhood: "Orchard", address: "320 Orchard Road, 238865", city: "Singapore", category: "bar", contact: "6100 7778")
Cafe.create(user: User.find(User.first.id + 35), name: "Breko Cafe", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Holland Village", address: "38 Lorong Mambong, Singapore 277694", city: "Singapore", category: "cafe", contact: "6468 4424")
Cafe.create(user: User.find(User.first.id + 36), name: "Sunday Folks", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Holland Village", address: "44 Jalan Merah Saga, Singapore 278116", city: "Singapore", category: "cafe", contact: "6479 9166")
Cafe.create(user: User.find(User.first.id + 37), name: "Wala Wala", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Holland Village", address: "31 Lorong Mambong, Singapore 277689", city: "Singapore", category: "cafe", contact: "6462 4288")
Cafe.create(user: User.find(User.first.id + 38), name: "Oporto", description: "Inspired by the dining cultures of the East and West, we combine creative techniques of new age cooking with premium ingredients and edgy presentation.", neighbourhood: "Holland Village", address: "3 Lorong Liput, Holland Village, 277725", city: "Singapore", category: "restaurant", contact: "3937 2983")
Cafe.create(user: User.find(User.first.id + 39), name: "Baden Restaurant & Pub", description: "Our stunningly appointed cocktail bar serves fine wines, handcrafted cocktails and sweeping views of the city.", neighbourhood: "Holland Village", address: "42 Lorong Mambong, Singapore 277696", city: "Singapore", category: "bar", contact: "6463 8127")


puts "Creating tags..."
#list of ambience tags
Tag.create(tag_category: "ambience", name: "classic" )
Tag.create(tag_category: "ambience", name: "elegant" )
Tag.create(tag_category: "ambience", name: "energetic" )
Tag.create(tag_category: "ambience", name: "friendly" )
Tag.create(tag_category: "ambience", name: "minimalistic" )
Tag.create(tag_category: "ambience", name: "industrial" )
Tag.create(tag_category: "ambience", name: "modern" )
Tag.create(tag_category: "ambience", name: "vintage" )
Tag.create(tag_category: "ambience", name: "natural lighting" )
Tag.create(tag_category: "ambience", name: "soft lighting" )
Tag.create(tag_category: "ambience", name: "soft acoustic music" )
Tag.create(tag_category: "ambience", name: "light jazz music" )

#list of amenity tags
Tag.create(tag_category: "amenity", name: "private rooms" )
Tag.create(tag_category: "amenity", name: "daily storage space" )
Tag.create(tag_category: "amenity", name: "booth seats" )
Tag.create(tag_category: "amenity", name: "bar seats" )
Tag.create(tag_category: "amenity", name: "free parking" )
Tag.create(tag_category: "amenity", name: "nearby parking" )
Tag.create(tag_category: "amenity", name: "lounge area" )
Tag.create(tag_category: "amenity", name: "high-speed wifi" )


puts "Creating cafe tags..."
#list of cafe tags for each cafe
Cafe.all.each do |cafe|
  tag1 = CafeTag.create(cafe: cafe, tag: Tag.find(Tag.first.id + rand(0..5)))
  tag2 = CafeTag.create(cafe: cafe, tag: Tag.find(Tag.first.id + rand(6..9)))
  tag3 = CafeTag.create(cafe: cafe, tag: Tag.find(Tag.first.id + rand(10..11)))
  tag4 = CafeTag.create(cafe: cafe, tag: Tag.find(Tag.first.id + rand(12..15)))
  tag5 = CafeTag.create(cafe: cafe, tag: Tag.find(Tag.first.id + rand(16..19)))
end


puts "Creating reviews..."
#list of reviews for each cafe
Cafe.all.each do |cafe|
  review1 = Review.new(user: User.find(User.first.id + rand(0..9)), cafe: cafe, content:"Great time here! Very friendly owner and staff. Would definitely recommend", rating: 5)
  review2 = Review.new(user: User.find(User.first.id + rand(0..9)), cafe: cafe, content:"Loved working here. Had the best ambience, the friendliest service, and the coffee got me WIRED.", rating: 5)
  review3 = Review.new(user: User.find(User.first.id + rand(0..9)), cafe: cafe, content:"Super reliable and productive workspace! Lots of sockets and fast wifi. New favorite spot.", rating: 5)
  review4 = Review.new(user: User.find(User.first.id + rand(0..9)), cafe: cafe, content:"Food was quite pricey but environment is pretty chill. Still a pretty decent place to head to.", rating: 4)
  review5 = Review.new(user: User.find(User.first.id + rand(0..9)), cafe: cafe, content:"Everything was great, except the wifi was a bit slow for Netflix. Probably means I shouldn't be watching Netflix...", rating: 4)
  review6 = Review.new(user: User.find(User.first.id + rand(0..9)), cafe: cafe, content:"I loved this place! Really reliable workspace with fast internet, plenty of power sockets, and great food - albeit a little pricy.", rating: 4)
  review7 = Review.new(user: User.find(User.first.id + rand(0..9)), cafe: cafe, content:"Neutral experience. Decent but could be better. Only come if there aren't better options.", rating: 3)
  review8 = Review.new(user: User.find(User.first.id + rand(0..9)), cafe: cafe, content:"Don't visit. Waste of time. Food is bad and expensive.", rating: 2)
  review9 = Review.new(user: User.find(User.first.id + rand(0..9)), cafe: cafe, content:"Terrible experience!! No chargers as claimed, lousy wifi and even though we paid for the seats the owner treated us like second-class citizens. GET YOURSELF TOGETHER PLEASE.", rating: 1)
  reviews = [review1, review2, review3, review4, review5, review6, review7, review8, review9]

  sample1 = reviews.sample.save
  reviews.delete(sample1)
  sample2 = reviews.sample.save
  reviews.delete(sample2)
  sample3 = reviews.sample.save
  reviews.delete(sample3)
  sample4 = reviews.sample.save
  reviews.delete(sample4)
  sample5 = reviews.sample.save
  reviews.delete(sample5)
  sample6 = reviews.sample.save
  reviews.delete(sample6)
end

puts "Creating hourly slots..."
#list of hourly slots
Cafe.all.each do |cafe|
  price = rand(4..8)
  12.times do |index|
    HourlySlot.create(cafe: cafe, start_time: 8 + index, total_seats: rand(3..5), price_per_hour: price, date: Date.today)
  end
end

puts "Creating bookings and booked hours..."
#list of user bookings
users = User.where(owner: false)
users.each_with_index do |user, index|
  time1 = 8
  hourly_slot = Cafe.find(Cafe.first.id + index).hourly_slots.where(start_time: time1).first
  booking1 = Booking.create(user: user, date: Date.today, start_time: time1, duration: 2, special_requests: "Window Seat", total_credits: hourly_slot.price_per_hour * 2, remaining_credits: hourly_slot.price_per_hour * 2)
  BookedHour.create!(booking: booking1, hourly_slot: hourly_slot, paid: true)
  BookedHour.create!(booking: booking1, hourly_slot: Cafe.find(Cafe.first.id + index).hourly_slots.where(start_time: time1 + 1).first, paid: true)
  # time2 = 10
  # booking2 = Booking.create(user: user, date: Date.today + 1, start_time: time2, duration: 2)
  # BookedHour.create(booking: booking1, hourly_slot: Cafe.find(Cafe.first.id + 2 + index).hourly_slots.where(start_time: time2).first, paid: true)
  # time3 = 11
  # booking3 = Booking.create(user: user, date: Date.today + 2, start_time: time3, duration: 1, special_requests: "Sofa Seat")
  # BookedHour.create(booking: booking1, hourly_slot: Cafe.find(Cafe.first.id + 3 + index).hourly_slots.where(start_time: time3).first, paid: true)
end

#list of past bookings
users.each_with_index do |user|
  time2 = 9
  booking2 = Booking.create(user: user, date: (Date.today - 2), start_time: time2, duration: 4)
  time3 = 8
  booking3 = Booking.create(user: user, date: (Date.today - 3), start_time: time3, duration: 5)
  time4 = 10
  booking4 = Booking.create(user: user, date: (Date.today - 4), start_time: time4, duration: 3)
  time2.times do |index|
    BookedHour.create(booking: booking2, hourly_slot: Cafe.find(Cafe.first.id + index + 1).hourly_slots.where(start_time: time2 + index).first, paid: true)
  end
  time3.times do |index|
    BookedHour.create(booking: booking3, hourly_slot: Cafe.find(Cafe.first.id + index + 3).hourly_slots.where(start_time: time3 + index).first, paid: true)
  end
  time4.times do |index|
    BookedHour.create(booking: booking4, hourly_slot: Cafe.find(Cafe.first.id + index + 5).hourly_slots.where(start_time: time4 + index).first, paid: true)
  end
end

#Booking.new(user: User.all.sample, date: (Date.today - 1 - index), start_time: start_time, duration: duration, total_credits: (rand(5..10) * duration))

puts "Creating menu items..."
Cafe.all.each do |cafe|
  MenuItem.create(name: "croque monsieur", description: "a single layer of French ham and Gruyere pressed between two thin slices of bread", category: "food", price: 10, cafe: cafe)
  MenuItem.create(name: "egg & cheese sandwich", description: "tasty, buttery, cheesy sandwich with egg", category: "food", price: 7, cafe: cafe)
  MenuItem.create(name: "ham & cheese croissant", description: "tasty, buttery, cheesy croissants with ham", category: "food", price: 8, cafe: cafe)
  MenuItem.create(name: "french fries", description: "delicious and versatile side dish perfect for any and every meal", category: "food", price: 6, cafe: cafe)
  MenuItem.create(name: "caesar salad", description: "Caesar Salad with dressing of delicious olive oil, garlic, raw eggs, and anchovies.", category: "food", price: 7, cafe: cafe)
  MenuItem.create(name: "tiramisu cup", description: "classic Italian dessert combining espresso-dipped ladyfingers and mascarpone cream", category: "food", price: 6, cafe: cafe)
  MenuItem.create(name: "espresso", category: "drink", price: 3, cafe: cafe)
  MenuItem.create(name: "flat white", category: "drink", price: 4, cafe: cafe)
  MenuItem.create(name: "mocha", category: "drink", price: 4, cafe: cafe)
  MenuItem.create(name: "chai latte", category: "drink", price: 5, cafe: cafe)
end

puts "Creating past bookings for the first cafe..."
#create random number of bookings for each day
20.times do |index|
  rand(1..3).times do |i|
    start_time = 8 + i * 3
    duration = rand(1..3)
    hourly_slot = Cafe.first.hourly_slots.where(start_time: start_time).first
    total_credits = rand(5..10) * duration
    booking = Booking.create!(user: User.all.sample, date: (Date.today - 1 - index), start_time: start_time, duration: duration, total_credits: total_credits)
    BookedHour.create!(booking: booking, hourly_slot: Cafe.first.hourly_slots.where(start_time: start_time).first, paid: true)
    Order.create!(menu_item: MenuItem.where(cafe: Cafe.first).sample, booking: booking)
  end
end

puts "Seeds done!"
