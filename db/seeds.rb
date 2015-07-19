require 'faker'

user1 = User.create(first_name: "mike", last_name: "b", username: "mikeb", password: "123456", email: "mike@example.com", phone_number: "011-345-6789")

user2 = User.create(first_name: "jordan", last_name: "c", username: "jordanc", password: "123456", email: "jordan@example.com", phone_number: "012-345-6789")

user3 = User.create(first_name: "sheldon", last_name: "m", username: "sheldonm", password: "123456", email: "sheldon@example.com", phone_number: "013-345-6789")

10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user_name,
    password: Faker::Internet.password(6),
    email: Faker::Internet.safe_email,
    phone_number: Faker::PhoneNumber.phone_number
    )

5.times do
  user1.games.create(
    sport: "Basketball",
    start_time: "2015-7-20 16:00",
    end_time: "2015-7-20 17:00",
    location: "Grand Central Park",
    owner_id: 1
    )
end

game1 = Game.create(sport: "Basketball", start_time: "2015-7-20 16:00", end_time: "2015-7-20 17:00", location: "Bryant Park", owner_id: 2)

game2 = Game.create(sport: "Basketball", start_time: "2015-7-20 16:00", end_time: "2015-7-20 17:00", location: "Battery Park", owner_id: 3)

10.times do
  game1.players.create(
    user_id: Faker::Number.between(1,)
    )


Player.create(user_id: 1, game_id: 1, attending: false)
Player.create(user_id: 2, game_id: 2, attending: false)
Player.create(user_id: 3, game_id: 3, attending: false)
Player.create(user_id: 2, game_id: 3, attending: false)
Player.create(user_id: 2, game_id: 3, attending: true)
Player.create(user_id: 2, game_id: 3, attending: true)
Player.create(user_id: 2, game_id: 3, attending: true)
Player.create(user_id: 2, game_id: 3, attending: true)