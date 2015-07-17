require 'rails_helper'

describe 'Games Controller' do
  User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', phone_number: '555-555-5555', password: '123456', username: 'johndoe')

  # before(:each) do
  #   visit("/")
  #   fill_in 'user_username', with: "johndoe"
  #   fill_in 'user_password', with: "123456"
  #   click_button 'Login'
  # end

  # describe 'POST #create' do
  #   it 'should create a game' do
  #     click_link('Create A Game')
  #     fill_in 'sport', :with => "Basketball"
  #     fill_in 'start_time', :with => Time.now
  #     fill_in 'end_time', :with => Time.now
  #     fill_in 'location', :with => "GC Park"
  #     click_button "Create Game"
  #     expect(page).to have_content("GC Park")
  #   end
  # end
end