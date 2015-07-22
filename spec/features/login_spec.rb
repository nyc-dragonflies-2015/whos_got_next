require 'rails_helper'

describe "the signin/out process" do

  before :each do
    visit root_path
    click_link "Sign-Up"
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Phone number', with: '555-555-5555'
    fill_in 'Username', with: 'johndoe'
    fill_in 'Password', with: '123456'
    click_button 'Create'
  end

  feature "signup" do
    scenario "should sign up the user" do
      visit root_path
      expect(page).to have_content('Logout')
    end
  end

  feature "logout" do
    scenario "should log the user out" do
    visit root_path
    click_link "Logout"
    expect(page).to have_content "Sign-Up"
    end
  end


  feature "login" do
    scenario "should log the user in" do
      visit root_path
      click_link 'Logout'
      visit root_path
      click_link 'Login'
      find('#user_username').set('johndoe')
      find('#user_password').set('123456')
      click_button 'Login'
      expect(page).to have_link('Logout')
    end
  end
end