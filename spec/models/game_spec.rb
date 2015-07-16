require 'rails_helper'

describe Game do
  let(:user) { User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', phone_number: '555-555-5555', password: '123456', username: 'johndoe') }
  let(:game) { Game.create(sport: 'Basketball', start_time: '2015-07-13 18:35:57', end_time: '2015-07-13 19:35:57', location: 'Central Park', owner_id: user.id) }

  it { should belong_to(:owner) }
  it { should have_many(:players) }
  it { should have_many(:users) }
end
