require 'rails_helper'

describe Game do
  let(:user) { User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', phone_number: '555-555-5555', password: '123456', username: 'johndoe') }
  let(:game) { Game.create(sport: 'Basketball', start_time: '2015-07-13 18:35:57', end_time: '2015-07-13 19:35:57', location: 'Central Park', owner_id: user.id) }
  # let(:user) { Player.create(game_id: game.id, user_id: user.id)}

  it { should belong_to(:owner) }
  it { should have_many(:players) }
  it { should have_many(:users) }

  it { should validate_presence_of(:sport) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:location) }

  it "#user_status should return 'Not Attending' if the user passed in is not attending the game" do
    invite = game.invites.build(user_id: user.id, attending: false)
    invite.save

    expect(game.user_status(user.id)).to eq('Not Attending')
  end

  it "#user_status should return 'Attending' if the user passed in is attending the game" do
    invite = game.invites.build(user_id: user.id, attending: true)
    invite.save

    expect(game.user_status(user.id)).to eq('Attending')
  end
end
