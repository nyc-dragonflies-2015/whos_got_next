# require 'rails_helper'

# feature "signup" do
#   scenario "should sign up the user" do
#     visit root_path
#     click_link "Sign-up"
#     fill_in 'first_name', with: 'Mike'
#     fill_in 'last_name', with: 'Doe'
#     fill_in 'email', with: 'miked@example.com'
#     fill_in 'phone_number', with: '555-555-5555'
#     fill_in 'username', with: 'mikedoe'
#     fill_in 'password', with: '123456'
#     click_button 'Create'
#     expect(page).to have_content('Logout')
#   end
# end

# feature "logout" do
#   scenario "should log the user in" do
#   user = User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', phone_number: '555-555-5555', password: '123456', username: 'johndoe')
#   visit root_path
#   click_link "Logout"
#   expect(page).to have_content "Sign-up"
#   end
# end

# feature "login" do
#   scenario "should log the user in" do
#     visit root_path
#     click_link "Sign-up"
#     fill_in 'first_name', with: 'John'
#     fill_in 'last_name', with: 'Doe'
#     fill_in 'email', with: 'john@example.com'
#     fill_in 'phone_number', with: '555-555-5555'
#     fill_in 'username', with: 'johndoe'
#     fill_in 'password', with: '123456'
#     click_button 'Create'
#     click_link 'Logout'
#     visit root_path
#     find('#user_username').set('johndoe')
#     find('#user_password').set('123456')
#     click_button 'Login'
#     expect(page).to have_link('Logout')
#   end
# end
