require "date"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning the db...."
Booking.destroy_all
Gear.destroy_all
Assignment.destroy_all
User.destroy_all
Role.destroy_all

puts "Creating role..."
role1 = Role.create!(name: 'owner')
role2 = Role.create!(name: 'admin')

puts "Creating user..."
user = User.create!(first_name: "James", last_name: "Reed", email: "james@mail.com", password: "123123")
user2 = User.create!(first_name: "Shunjiro", last_name: "Yatsuzuka", email: "shunjiro@mail.com", password: "123123")
user3 = User.create!(first_name: "Shingo", last_name: "Kubomura", email: "shingo@mail.com", password: "123123")
user4 = User.create!(first_name: "Edmund", last_name: "Oh", email: "edmund@mail.com", password: "123123")
puts "... #{User.count} Users."
customer = User.create!(first_name: "Customer", last_name: "A", email: "customer@mail.com", password: "123123")
owner = User.create!(first_name: "Owner", last_name: "B", email: "owner@mail.com", password: "123123")
admin = User.create!(first_name: "Admin", last_name: "C", email: "admin@mail.com", password: "123123")
puts "... #{User.count} Users."

puts "Creating assignment..."
Assignment.create!(user: user, role: role1)
Assignment.create!(user: user2, role: role1)
Assignment.create!(user: user3, role: role1)
Assignment.create!(user: user4, role: role1)
Assignment.create!(user: owner, role: role1)
Assignment.create!(user: admin, role: role2)

puts "Creating gear..."
gear = Gear.create!(title: "Roxy Poppy Package Snowboard - Girls' 2022", description: "The Roxy Poppy Snowboard Package is the best way to get your little snowboarder out on the hill making her first turns. With an easy rockered shape and a gentle flex, the Poppy likes to make smooth turns, and is resistant to catching an edge. The smaller sized Poppys come mounted with Poppy Speed Strap Bindings, perfect for the tiniest feet, while the bigger ones come mounted with the Poppy Traditional Binding, which is just like a grownup binding, but smaller.", img_url: 'https://images.evo.com/imgp/700/181713/738562/clone.jpg', price: 2490.0, address: "Ogawa, Kamiminochi District, Nagano", user: user)
gear1 = Gear.create!(title: "Arbor Poparazzi Rocker LTD Snowboard ​+ Acacia Snowboard Bindings - Women's 2022", description: "The Arbor Poparazzi Rocker LTD Snowboard is all about fun. It's the most well-rounded women's-specific shape in the Arbor lineup, with a design that aims at riding it all. It has a smooth, soft flex and twin shape for freestyle performance, a solid construction for durability, and reliable edge hold for consistent riding on the groomers and steeps. Arbor's System Rocker profile makes this board super easy to turn and flowy to ride, especially in deeper snow, so this is a great choice for intermediate riders looking for a progression friendly board they won't grow out of. This LTD version features a beautiful ash power ply topsheet and is only available from evo.", img_url: 'https://images.evo.com/imgp/700/218654/896540/arbor-poparazzi-rocker-ltd-snowboard-acacia-snowboard-bindings-women-s-2022-.jpg' , price: 3430.0, address: "Komoro Shi, Nagano, Japan", user: user2)
gear2 = Gear.create!(title: "Salomon Assassin Pro Snowboard ​+ Hologram Snowboard Bindings 2022", description: "Not just a killer, but a paid professional destroyer of snows great and meager, the Salomon Assassin Pro Snowboard is Salomon's top all-mountain charger and a true quiver-of-one for the advanced rider. Built as a directional twin with centered stance, the Assassin Pro rips in the park, but you'd be foolish to limit the fun to hits and rails - this deck rules the steep and deep with a passion as well.", img_url: 'https://images.evo.com/imgp/700/225455/903943/salomon-assassin-pro-snowboard-hologram-snowboard-bindings-2022-.jpg' , price: 4490.0, address: "Hirose, Nagano", user: user3)
gear3 = Gear.create!(title: "CAPiTA Spring Break Powder Twin Snowboard ​+ Union Force Pro Snowboard Bindings 2022", description: "Yeah, that's right: CAPiTA Spring Break Powder Twin Snowboard. Powder. Twin. It makes sense when you remember the surfy, playful, don't-take-yourself-so-seriously ethos of the Spring Break line. The Powder Twin keeps the extra wide waist, the tight, carvey turn radius, and gentle Surf Rocker profile of its directional cousins, but packages them together in a Twin shape that's perfect for playful freestyle powder riding. Grab your homies and get to work that backcountry booter you've been talking about for years, this is the board you've been waiting for.", img_url: 'https://images.evo.com/imgp/700/225708/904343/capita-spring-break-powder-twin-snowboard-union-force-pro-snowboard-bindings-2022-.jpg', price: 2390.0, address: "Matsumoto Shi, Nagano, Japan", user: user4)
gear4 = Gear.create!(title: "Salomon Huck Knife Snowboard ​+ Union Force Snowboard Bindings 2022", description: "LIke running with scissors, riding with the Salomon Huck Knife Snowboard has its risks. We don't think you'll stab yourself, but be forewarned: The thrill of sticking a new trick on a regular basis on the Huck Knife can be addicting. This board is one Salomon's biggest sellers, and for good reason - it excels in the park and rewards expertise but doesn't punish the rider working their way up the learning curve. Built with Quad Camber for pop and energy without the sometimes taxing demands of full camber, and with a medium stone structured sintered base for speed without suction, the Huck Knife is the multi-tool you seek.", img_url: 'https://images.evo.com/imgp/700/225980/905578/salomon-huck-knife-snowboard-union-force-snowboard-bindings-2022-.jpg', price: 5590.0, address: "Ogawa, Kamiminochi District, Nagano", user: user)
gear5 = Gear.create!(title: "Burton Process Snowboard ​+ Cartel EST Snowboard Bindings 2022", description: "Trust the Process and you shall be rewarded. The Burton Process Snowboard has been a trusted member of the family for years. A tweak here, a small update there, but nonetheless it has remained one of the best twin quiver killers in the game. Frostbite Edges improve traction on hardpack, a versatile twin shape and flex offer reliable handling in the park, and a light weight build makes for a ride that's just as inviting on the last lap of the day as it is on the first.", img_url: 'https://images.evo.com/imgp/700/221584/894349/burton-process-snowboard-cartel-est-snowboard-bindings-2022-.jpg', price: 6990.0, address: "Miasa, Omachi, Nagano", user: user2)
gear6 = Gear.create!(title: "Season Nexus Snowboard ​+ Union Force Snowboard Bindings 2022", description: "The Season Nexus Snowboard stands out in the arms race of bloated quivers and technical jargon - a simple skeleton key capable of unlocking the innate potential of any day in the mountains. Its straightforward geometry cuts through the noise, creating something that adds up to much more than the sum of its parts. Ample float in powder, smooth, engaged turns on hardpack, and dependable performance in everyday resort chop. It’s the ultimate quiver of one - more than enough to remind you why you fell in love with snowboarding in the first place.", img_url: 'https://images.evo.com/imgp/700/216905/909399/season-nexus-snowboard-union-force-snowboard-bindings-2022-.jpg', price: 6590.0, address: "Hirose, Nagano", user: user3)
gear7 = Gear.create!(title: "Roxy Breeze Snowboard ​+ Flow Mayon Snowboard Bindings - Women's 2022", description: "Shred the entire mountain with ease on the Roxy Breeze Snowboard. The Breeze is designed with a setback stance and a snappy medium flex, along with a C2 rocker profile to keep you surfing through powder and leaving clean trenches in the groomed. It's time to start making a name for yourself and leading the pack with the Roxy Breeze Snowboard.", img_url: 'https://images.evo.com/imgp/700/227211/912481/roxy-breeze-snowboard-flow-mayon-snowboard-bindings-women-s-2022-.jpg', price: 4590.0, address: "こぶたや, 中央6-4-57, Ueda Shi, Nagano 386-0012, Japan", user: user4)
puts "... #{Gear.count} gear listed."

puts "Creating bookings...."
puts "for James"
Booking.create!(start_date: Date.new(2022, 6, 1), end_date: Date.new(2022, 6, 30), status: "Accepted", gear: gear, user: user)
Booking.create!(start_date: Date.new(2022, 7, 1), end_date: Date.new(2022, 7, 31), status: "Requested", gear: gear2, user: user)
Booking.create!(start_date: Date.new(2022, 8, 1), end_date: Date.new(2022, 8, 31), status: "Canceled", gear: gear3, user: user)

puts "for Shunjiro"
Booking.create!(start_date: Date.new(2022, 6, 1), end_date: Date.new(2022, 6, 30), status: "Accepted", gear: gear2, user: user2)
Booking.create!(start_date: Date.new(2022, 7, 1), end_date: Date.new(2022, 7, 31), status: "Requested", gear: gear3, user: user2)
Booking.create!(start_date: Date.new(2022, 8, 1), end_date: Date.new(2022, 8, 31), status: "Canceled", gear: gear4, user: user2)

puts "for Shingo"
Booking.create!(start_date: Date.new(2022, 6, 1), end_date: Date.new(2022, 6, 30), status: "Accepted", gear: gear3, user: user3)
Booking.create!(start_date: Date.new(2022, 7, 1), end_date: Date.new(2022, 7, 31), status: "Requested", gear: gear4, user: user3)
Booking.create!(start_date: Date.new(2022, 8, 1), end_date: Date.new(2022, 8, 31), status: "Canceled", gear: gear5, user: user3)

puts "for Ed"
Booking.create!(start_date: Date.new(2022, 6, 1), end_date: Date.new(2022, 6, 30), status: "Accepted", gear: gear4, user: user4)
Booking.create!(start_date: Date.new(2022, 7, 1), end_date: Date.new(2022, 7, 31), status: "Requested", gear: gear5, user: user4)
Booking.create!(start_date: Date.new(2022, 8, 1), end_date: Date.new(2022, 8, 31), status: "Canceled", gear: gear6, user: user4)

puts "... #{Booking.count} bookings."
