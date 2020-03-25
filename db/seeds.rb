# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying seeds.."
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

# list of non-owner users
User.create(email: 'user11@gmail.com', password: 'pass1234', owner: true, first_name: "Will", last_name: "Smith")
User.create(email: 'user12@gmail.com', password: 'pass1234', owner: true, first_name: "Phoebe", last_name: "Buffay")
User.create(email: 'user13@gmail.com', password: 'pass1234', owner: true, first_name: "Jennifer", last_name: "Lopez")
User.create(email: 'user14@gmail.com', password: 'pass1234', owner: true, first_name: "Trevor", last_name: "Noah")
User.create(email: 'user15@gmail.com', password: 'pass1234', owner: true, first_name: "Justin", last_name: "Bieber")
User.create(email: 'user16@gmail.com', password: 'pass1234', owner: true, first_name: "Selena", last_name: "Gomez")
User.create(email: 'user17@gmail.com', password: 'pass1234', owner: true, first_name: "Paul", last_name: "McCartney")
User.create(email: 'user18@gmail.com', password: 'pass1234', owner: true, first_name: "Chris", last_name: "Paul")
User.create(email: 'user19@gmail.com', password: 'pass1234', owner: true, first_name: "Kobe", last_name: "Bryant")
User.create(email: 'user20@gmail.com', password: 'pass1234', owner: true, first_name: "Larry", last_name: "Bird")


puts "Creating cafes..."
#list of cafes linked to owner users
Cafe.create(user: User.first, name: "The Clue-less Goat", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Novena", address: "189 Thomson Rd, Singapore", city: "Singapore", category: "cafe", contact: "8283 0885")
Cafe.create(user: User.find(User.first.id + 1), name: "Craftsmen Specialty Coffee", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Novena", address: "173 Thomson Rd, Singapore", city: "Singapore", category: "cafe", contact: "9658 0769")
Cafe.create(user: User.find(User.first.id + 2), name: "Kyushu Pancake Cafe", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Novena", address: "275 Thomson Rd, Singapore", city: "Singapore", category: "cafe", contact: "6352 6265")
Cafe.create(user: User.find(User.first.id + 3), name: "Da Luca", description: "Inspired by the dining cultures of the East and West, we combine creative techniques of new age cooking with premium ingredients and edgy presentation.", neighbourhood: "Novena", address: "Goldhill Plaza #01-19/21, 1, Singapore 308899", city: "Singapore", category: "restaurant", contact: "6258 4846")
Cafe.create(user: User.find(User.first.id + 4), name: "Urbana Rooftop Bar", description: "Our stunningly appointed cocktail bar serves fine wines, handcrafted cocktails and sweeping views of the city.", neighbourhood: "Novena", address: "Floor 33 @ Courtyard Marriott, 99, Irrawaddy Rd, Singapore 329568", city: "Singapore", category: "bar", contact: "6378 2060")
Cafe.create(user: User.find(User.first.id + 5), name: "Two Hana", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Tampines", address: "Century Square, #01-21, 2 Tampines Central 5, 529509", city: "Singapore", category: "cafe", contact: "6260 4321")
Cafe.create(user: User.find(User.first.id + 6), name: "MO Cafe", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Tampines", address: "50 Tampines North Drive 2, Level 2, Singapore 528766", city: "Singapore", category: "cafe", contact: "6382 2937")
Cafe.create(user: User.find(User.first.id + 7), name: "Three's A Crowd", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Tampines", address: "802 Tampines Ave 4, #01-11, Singapore 520802", city: "Singapore", category: "cafe", contact: "6702 0700")
Cafe.create(user: User.find(User.first.id + 8), name: "Tipsy Penguin", description: "restaurantdesc", neighbourhood: "Tampines", address: "300 Tampines Ave 5, #01-02A, Singapore 529653", city: "Singapore", category: "restaurant", contact: "8223 2983")
Cafe.create(user: User.find(User.first.id + 9), name: "Five Izakaya", description: "Our stunningly appointed cocktail bar serves fine wines, handcrafted cocktails and sweeping views of the city.", neighbourhood: "Tampines", address: "5 Changi Business Park Central 1, #01-66/67, Singapore 486038", city: "Singapore", category: "bar", contact: "6604 8255")

Cafe.create(user: User.last, name: "Group Therapy Coffee", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Katong", address: "30, #01-11 E Coast Rd, 428751", city: "Singapore", category: "cafe", contact: "7369 0885")
Cafe.create(user: User.find(User.last.id - 1), name: "2Six Cafe", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Katong", address: "88 E Coast Rd, #01-10, Singapore 423371", city: "Singapore", category: "cafe", contact: "6247 7548")
Cafe.create(user: User.find(User.last.id - 2), name: "Rabbit Carrot Gun", description: "Inspired by the dining cultures of the East and West, we combine creative techniques of new age cooking with premium ingredients and edgy presentation.", neighbourhood: "Katong", address: "47 - 49 E Coast Rd, Singapore 428768", city: "Singapore", category: "restaurant", contact: "6348 8568")
Cafe.create(user: User.find(User.last.id - 3), name: "Platypus Cantina", description: "Inspired by the dining cultures of the East and West, we combine creative techniques of new age cooking with premium ingredients and edgy presentation.", neighbourhood: "Katong", address: "171 E Coast Rd, Singapore 428877", city: "Singapore", category: "restaurant", contact: "6344 0166")
Cafe.create(user: User.find(User.last.id - 4), name: "The Trenchard Arms", description: "Our stunningly appointed cocktail bar serves fine wines, handcrafted cocktails and sweeping views of the city.", neighbourhood: "Katong", address: "47 E Coast Rd, Singapore 428767", city: "Singapore", category: "bar", contact: "6348 8568")
Cafe.create(user: User.find(User.last.id - 5), name: "Poppy Pops", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Jurong East", address: "50 Jurong Gateway Rd, #06-03 Jem, Singapore 608549", city: "Singapore", category: "cafe", contact: "6262 0339")
Cafe.create(user: User.find(User.last.id - 6), name: "Time Table Cafe", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Jurong East", address: "Jurong West Street 41, #01-726 Block 456, Singapore 640456", city: "Singapore", category: "cafe", contact: "6566 5088")
Cafe.create(user: User.find(User.last.id - 7), name: "PocoLoco", description: "Inspired by the dining cultures of the East and West, we combine creative techniques of new age cooking with premium ingredients and edgy presentation.", neighbourhood: "Jurong East", address: "21 Jurong Town Hall Rd, Level 2 Snow City, Singapore 609433", city: "Singapore", category: "restaurant", contact: "8866 4646")
Cafe.create(user: User.find(User.last.id - 8), name: "The Good Trio", description: "Inspired by the dining cultures of the East and West, we combine creative techniques of new age cooking with premium ingredients and edgy presentation.", neighbourhood: "Jurong East", address: "2, #01-17 Jurong East Central 1, JCube, Singapore 609731", city: "Singapore", category: "restaurant", contact: "6694 1897")
Cafe.create(user: User.find(User.last.id - 9), name: "Faber Valley Pub", description: "Our stunningly appointed cocktail bar serves fine wines, handcrafted cocktails and sweeping views of the city.", neighbourhood: "Jurong East", address: "114 Faber Dr, Singapore 129426", city: "Singapore", category: "bar", contact: "6778 7101")

Cafe.create(user: User.first, name: "Oriole Coffee", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Orchard", address: "96, #01-01 Somerset Rd, 238163", city: "Singapore", category: "cafe", contact: "6238 8348")
Cafe.create(user: User.find(User.first.id + 1), name: "dal.komm COFFEE", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Orchard", address: "176 Orchard Road, The Centrepoint, 238843", city: "Singapore", category: "cafe", contact: "7438 0769")
Cafe.create(user: User.find(User.first.id + 2), name: "Baker's Brew", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Orchard", address: "290 Orchard Rd, #05-46 Paragon Shopping Centre, Singapore 238859", city: "Singapore", category: "cafe", contact: "6909 0669")
Cafe.create(user: User.find(User.first.id + 3), name: "Som Tam", description: "Inspired by the dining cultures of the East and West, we combine creative techniques of new age cooking with premium ingredients and edgy presentation.", neighbourhood: "Orchard", address: "181, 08-13 Orchard Rd, 238896", city: "Singapore", category: "restaurant", contact: "6238 6872")
Cafe.create(user: User.find(User.first.id + 4), name: "The Other Room", description: "Our stunningly appointed cocktail bar serves fine wines, handcrafted cocktails and sweeping views of the city.", neighbourhood: "Orchard", address: "320 Orchard Road, #01-05 Marriott Tang Plaza Hotel, 238865", city: "Singapore", category: "bar", contact: "6100 7778")
Cafe.create(user: User.find(User.first.id + 5), name: "Breko Cafe", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Holland Village", address: "38 Lor Mambong, Singapore 277694", city: "Singapore", category: "cafe", contact: "6468 4424")
Cafe.create(user: User.find(User.first.id + 6), name: "Sunday Folks", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Holland Village", address: "44 Jln Merah Saga, #01-52 Chip Bee Gardens, Singapore 278116", city: "Singapore", category: "cafe", contact: "6479 9166")
Cafe.create(user: User.find(User.first.id + 7), name: "Wala Wala", description: "Established since 2013, we are inspired to serve great coffees with quality beans, hoping to bring a great end-to-end experiences for our customers in this fast pace country. We do believe that every cup matters and we are serious when it comes to our passion in making coffee, not to mention our dishes, which are delicious and well presented on your table.", neighbourhood: "Holland Village", address: "31 Lor Mambong, Singapore 277689", city: "Singapore", category: "cafe", contact: "6462 4288")
Cafe.create(user: User.find(User.first.id + 8), name: "Oporto", description: "Inspired by the dining cultures of the East and West, we combine creative techniques of new age cooking with premium ingredients and edgy presentation.", neighbourhood: "Holland Village", address: "#01-01, No. 3 Lor Liput, Holland Piazza, 277725", city: "Singapore", category: "restaurant", contact: "3937 2983")
Cafe.create(user: User.find(User.first.id + 9), name: "Baden Restaurant & Pub", description: "Our stunningly appointed cocktail bar serves fine wines, handcrafted cocktails and sweeping views of the city.", neighbourhood: "Holland Village", address: "42 Lor Mambong, Singapore 277696", city: "Singapore", category: "bar", contact: "6463 8127")


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
  review2 = Review.new(user: User.find(User.first.id + rand(0..9)), cafe: cafe, content:"Food was quite pricey but environment is pretty chill. Still a pretty decent place to head to.", rating: 4)
  review3 = Review.new(user: User.find(User.first.id + rand(0..9)), cafe: cafe, content:"Neutral experience. Decent but could be better. Only come if there aren't better options.", rating: 3)
  review4 = Review.new(user: User.find(User.first.id + rand(0..9)), cafe: cafe, content:"Don't visit. Waste of time. Food is bad and expensive.", rating: 2)
  review5 = Review.new(user: User.find(User.first.id + rand(0..9)), cafe: cafe, content:"Terrible experience!! No chargers as claimed, lousy wifi and even though we paid for the seats the owner treated us like second-class citizens. GET YOURSELF TOGETHER PLEASE. ", rating: 1)
  reviews = [review1, review2, review3, review4, review5]

  sample1 = reviews.sample.save
  reviews.delete(sample1)
  sample2 = reviews.sample.save
  reviews.delete(sample2)
  sample3 = reviews.sample.save
  reviews.delete(sample3)
end

puts "Seeds done!"

