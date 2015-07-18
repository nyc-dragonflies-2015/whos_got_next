# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(first_name: "mike", last_name: "b", username: "mikeb", password: "123456", email: "mike@example.com", phone_number: "011-345-6789")
User.create(first_name: "jordan", last_name: "c", username: "jordanc", password: "123456", email: "jordan@example.com", phone_number: "012-345-6789")
User.create(first_name: "sheldon", last_name: "m", username: "sheldonm", password: "123456", email: "sheldon@example.com", phone_number: "013-345-6789")
Game.create(sport: "Basketball", start_time: "2015-7-20 16:00", end_time: "2015-7-20 17:00", location: "Grand Central Park", owner_id: 1)
Game.create(sport: "Basketball", start_time: "2015-7-20 16:00", end_time: "2015-7-20 17:00", location: "Bryant Park", owner_id: 2)
Game.create(sport: "Basketball", start_time: "2015-7-20 16:00", end_time: "2015-7-20 17:00", location: "Battery Park", owner_id: 3)

Player.create(user_id: 1, game_id: 1, attending: false)
Player.create(user_id: 2, game_id: 2, attending: false)
Player.create(user_id: 3, game_id: 3, attending: false)
Player.create(user_id: 2, game_id: 3, attending: false)
Player.create(user_id: 2, game_id: 3, attending: true)
Player.create(user_id: 2, game_id: 3, attending: true)