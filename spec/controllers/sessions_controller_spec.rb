require 'rails_helper'

describe SessionsController do
  let!(:user) { User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', phone_number: '555-555-5555', password: '123456', username: 'johndoe') }


  describe "POST user#create" do
    it "should log a user in with correct credentials" do
      post :create, user: {username: user.username, password: user.password}
    expect(response).to redirect_to(root_path)
    end

    it "should not allow a user to log in with wrong credentials" do
      request.env['HTTP_REFERER'] = 'http://localhost:3000/sessions/new'
      post :create, user: {username: user.username, password: 'hellothere'}
      expect(response).to redirect_to(:back)
    end
  end

  describe "DELETE destroy" do
    it "should logout the user and destroy the session_id" do
      delete :destroy, id: user.id
      expect(session[:user_id]).to eq(nil)
    end
  end
end