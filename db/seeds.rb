require 'faker'

user1 = User.create(first_name: "mike", last_name: "b", username: "mikeb", password: "123456", email: "mike@example.com", phone_number: "011-345-6789")

user2 = User.create(first_name: "jordan", last_name: "c", username: "jordanc", password: "123456", email: "jordan@example.com", phone_number: "012-345-6789")

user3 = User.create(first_name: "sheldon", last_name: "m", username: "sheldonm", password: "123456", email: "sheldon@example.com", phone_number: "013-345-6789")

username_array = []
attending_array = ["true", "false"]

10.times do
  username_array << Faker::Internet.user_name
end

new_array = []
invites_array = (new_array << username_array).flatten

10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: username_array.pop,
    password: Faker::Internet.password(6),
    email: Faker::Internet.safe_email,
    phone_number: Faker::PhoneNumber.phone_number
    )
end

20.times do
  Game.create(
    sport: "Basketball",
    start_time: Faker::Time.forward(1, :morning),
    end_time: Faker::Time.forward(1, :evening),
    location: Faker::Address.street_name,
    private_game: false,
    owner_id: Faker::Number.between(1,3),
    )
end

5.times do
  Game.create(
    sport: "Basketball",
    start_time: Faker::Time.forward(1, :morning),
    end_time: Faker::Time.forward(1, :evening),
    location: Faker::Address.street_name,
    private_game: true,
    owner_id: Faker::Number.between(1,3),
    )
end

Game.all.each do |game|
  rand(10).times do
    invite = game.players.build(user_id: User.all.sample.id, attending: attending_array.sample)
    invite.save
  end
end

# game1 = Game.create(sport: "Basketball", start_time: "2015-7-20 16:00", end_time: "2015-7-20 17:00", location: "Bryant Park", owner_id: 2)

# game2 = Game.create(sport: "Basketball", start_time: "2015-7-20 16:00", end_time: "2015-7-20 17:00", location: "Battery Park", owner_id: 3)


# 20.times do
#   game1.players.create(
#     user_id: Faker::Number.between(1,10),
#     game_id: Faker::Number.between(1,2),
#     attending: attending_array.sample
#     )
# end

# 20.times do
#   game2.players.create(
#     user_id: Faker::Number.between(1,10),
#     game_id: Faker::Number.between(1,2),
#     attending: attending_array.sample
#     )
# end
