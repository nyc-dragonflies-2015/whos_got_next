require 'rails_helper'

describe Player do
  let!(:john) { User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', phone_number: '555-555-5555', password: '123456', username: 'johndoe') }
  let!(:jane) { User.create(first_name: 'Jane', last_name: 'Doe', email: 'jane@example.com', phone_number: '555-555-5555', password: '123456', username: 'janedoe') }
  let!(:game) { Game.create(sport: 'Basketball', start_time: '2015-07-13 18:35:57', end_time: '2015-07-13 19:35:57', location: 'Central Park', owner_id: jane.id) }
  let!(:player) { Player.create(user_id: john.id, game_id: game.id) }
  let!(:player2) { Player.create(user_id: jane.id, game_id: game.id, attending: true) }

  it { should belong_to(:user) }
  it { should belong_to(:game) }

  it 'should be able to attend a game' do
    expect(player2.attending).to be_truthy
  end

  it "#is_attending? should return 'Attending' if attending equals true" do
    expect(player2.is_attending?).to eq('Attending')
  end

  it "#is_attending? should return 'Not Attending' if attending equals false" do
    expect(player.is_attending?).to eq('Not Attending')
  end

  it "#attending_count should return a count of ? when passed game" do
    expect(Player.attending_count(game)).to eq(1)
  end
end
