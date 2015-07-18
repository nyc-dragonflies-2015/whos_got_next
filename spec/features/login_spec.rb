require 'rails_helper'


# feature "signup" do
#   scenario "should sign up the user" do
#     visit root_path
#     click_link "Sign-Up"
#     fill_in 'First name', with: 'John'
#     fill_in 'Last name', with: 'Doe'
#     fill_in 'Email', with: 'john@example.com'
#     fill_in 'Phone number', with: '555-555-5555'
#     fill_in 'Username', with: 'johndoe'
#     fill_in 'Password', with: '123456'
#     click_button 'Create'
#     puts html
#     expect(page).to have_content('Logout')
#   end



#   scenario "should log the user out" do
#   user = User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', phone_number: '555-555-5555', password: '123456', username: 'johndoe')
#   visit root_path
#   click_link "Sign-Up"
#   fill_in 'First name', with: 'John'
#   fill_in 'Last name', with: 'Doe'
#   fill_in 'Email', with: 'john@example.com'
#   fill_in 'Phone number', with: '555-555-5555'
#   fill_in 'Username', with: 'johndoe'
#   fill_in 'Password', with: '123456'
#   click_button 'Create'
#   visit root_path
#   click_link "Logout"
#   expect(page).to have_content "Sign-Up"
#   end



#   scenario "should log the user in" do
#     visit root_path
#     click_link "Sign-Up"
#     fill_in 'First name', with: 'John'
#     fill_in 'Last name', with: 'Doe'
#     fill_in 'Email', with: 'john@example.com'
#     fill_in 'Phone number', with: '555-555-5555'
#     fill_in 'Username', with: 'johndoe'
#     fill_in 'Password', with: '123456'
#     click_button 'Create'
#     visit root_path
#     click_link 'Logout'
#     visit root_path
#     find('#user_username').set('johndoe')
#     find('#user_password').set('123456')
#     click_button 'Login'
#     expect(page).to have_link('Logout')
#   end
# end
