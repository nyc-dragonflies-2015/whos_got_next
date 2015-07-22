require 'rails_helper'

  describe 'the joining/leaving a private game proccess', type: :feature do

    before :each do
      User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', phone_number: '555-555-5555', password: '123456', username: 'johndoe')
      User.create(first_name: 'Jane', last_name: 'Doe', email: 'jane@example.com', phone_number: '123-456-6789', password: '123456', username: 'janedoe')
      Game.create(sport: 'Basketball', start_time: '2015-07-28 18:35:57', end_time: '2015-07-28 19:35:57', location: 'Central Park', owner_id: 1, private_game: true)
      Player.create(user_id: User.last.id, game_id: game.last.id)

      visit root_path
      click_link 'Login'
      fill_in 'Username', with: 'janedoe'
      fill_in 'Password', with: '123456'
      click_button 'Login'
      visit root_path
    end

    scenario 'a player can join a private game if invited' do
      expect(Game.last.status).to eq('private')
      expect(page).to have_content('Status: Not Attending')
    end
  end