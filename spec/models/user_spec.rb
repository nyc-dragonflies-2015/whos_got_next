require 'rails_helper'

describe User do
  let(:user) { User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', phone_number: '555-555-5555', password: '123456', username: 'johndoe') }

  it { should have_many(:players) }
  it { should have_many(:games) }
  it { should have_many(:created_games) }
end
