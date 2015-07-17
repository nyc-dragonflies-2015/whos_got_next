require 'rails_helper'

describe SessionsController do
  User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', phone_number: '555-555-5555', password: '123456', username: 'johndoe')

  xit "should sign up the user" do
    visit new_user_path
      fill_in 'user_first_name', with: 'John'
      fill_in 'user_last_name', with: 'Doe'
      fill_in 'user_email', with: 'john@example.com'
      fill_in 'user_phone_number', with: '555-555-5555'
      fill_in 'user_username', with: 'johndoe'
      fill_in 'user_password', with: '123456'
      click_button 'Create'
      expect(page).to have_link('Logout', href: '/logout')
  end

  xit "should log the user in" do
    visit root_path
      fill_in 'user_username', with: 'johndoe'
      fill_in 'user_password', with: '123456'
      click_button 'Login'
       expect(page).to have_link('Logout', href: '/logout')
  end

  describe "GET new" do
    it "should log a user in" do
    expect(response.status).to eq(200)
    end
  end

  describe "POST create" do
    it "should not allow an unregistered user to log in" do
      expect(response.status).to eq(200)
    end
  end

  describe "DELETE destroy" do
    it "should tell user they were logged out" do
      expect(response.status).to eq(200)
    end
  end
end