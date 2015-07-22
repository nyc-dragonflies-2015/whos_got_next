require 'rails_helper'
  include GamesHelper

  describe 'the joining/leaving a private game proccess', type: :feature do

    before :each do
      User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', phone_number: '555-555-5555', password: '123456', username: 'johndoe')
      User.create(first_name: 'Jane', last_name: 'Doe', email: 'jane@example.com', phone_number: '123-456-6789', password: '123456', username: 'janedoe')
      Game.create(sport: 'Basketball', start_time: '2015-07-28 18:35:57', end_time: '2015-07-28 19:35:57', location: 'Central Park', owner_id: 1, private_game: true)
      Player.create(user_id: User.last.id, game_id: Game.last.id)

      visit root_path
      click_link 'Login'
      fill_in 'Username', with: 'janedoe'
      fill_in 'Password', with: '123456'
      click_button 'Login'
      visit root_path
    end

    scenario 'game should be private' do
      expect(Game.first.is_game_private?(Game.first)).to eq('Private')
      expect(page).to have_content('Status: Not Attending')
    end

    scenario 'user can join private game if invited' do
      click_button 'Join'
      expect(Player.attending_count(Game.first)).to eq(1)
      expect(page).to have_content('Status: Attending')
    end

    scenario 'user can leave a game after joining' do
      click_button 'Join'
      click_button 'Leave'
      expect(Player.attending_count(Game.first)).to eq(0)
      expect(page).to have_content('Status: Not Attending')
    end

    scenario 'user should not see private game if not invited' do
      click_link 'Logout'
      visit root_path
      click_link 'Login'
      fill_in 'Username', with: 'johndoe'
      fill_in 'Password', with: '123456'
      click_button 'Login'
      visit root_path

      expect(page).to have_no_content('Private')
    end
  end