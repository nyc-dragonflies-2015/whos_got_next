require 'rails_helper'

  describe 'the joining/leaving a game proccess', type: :feature do

  before :each do
    User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', phone_number: '555-555-5555', password: '123456', username: 'johndoe')
    Game.create(sport: 'Basketball', start_time: '2015-07-28 18:35:57', end_time: '2015-07-28 19:35:57', location: 'Central Park', owner_id: 1)

    visit root_path
    click_link 'Login'
    fill_in 'Username', with: 'johndoe'
    fill_in 'Password', with: '123456'
    click_button 'Login'
    visit root_path
  end

  scenario 'game should be public' do
    expect(Game.first.status).to eq('public')
    expect(page).to have_content('Status: Not Attending')
  end

  scenario 'user can join' do
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
end