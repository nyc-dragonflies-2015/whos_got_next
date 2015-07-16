require 'rails_helper'

describe User do
  let(:user) { User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', phone_number: '555-555-5555', password: '123456', username: 'johndoe') }

  describe 'players' do
    it 'should have many players' do
      expect(user).to respond_to :players
    end
  end

  describe 'games' do
    it 'should have many games' do
      expect(user).to respond_to :games
    end
  end

  describe 'created games' do
    it 'should have many created games' do
      expect(user).to respond_to :created_games
    end
  end
end
