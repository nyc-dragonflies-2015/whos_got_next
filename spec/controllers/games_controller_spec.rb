require 'rails_helper'

describe GamesController do
  let(:user) { User.create(first_name: "mike", last_name: "b", username: "mikeb", password: "123456", email: "mike@example.com", phone_number: "011-345-6789") }

  let(:game) { Game.create(sport: "Basketball", start_time: "2015-7-20 16:00", end_time: "2015-7-20 17:00", location: "Grand Central Park", owner_id: 1) }

  before :each do
    def user_attributes
      {first_name: "michael", last_name: "bozza", username: "mikeb", password: "123456", email: "mike@example.com", phone_number: "011-345-6789"}
    end

    def game_attributes
      {sport: "Basketball", start_time: "2015-7-20 16:00", end_time: "2015-7-20 17:00", location: "Grand Central Park", owner_id: 1}
    end

    def game_attributes_missing_sport
      {first_name: "mike", last_name: "b", password: "123456", email: "mike@example.com", phone_number: "011-345-6789"}
    end
  end

  describe "GET #index" do
    it "renders the games :index template" do
      get :index
      expect(response).to render_template :index
    end

    # it "loads all games" do
    #   game1 = Game.create(sport: "Basketball", start_time: "2015-7-20 16:00", end_time: "2015-7-20 17:00", location: "Battery Park", owner_id: 3)
    #   game2 = Game.create(sport: "Basketball", start_time: "2015-7-20 16:00", end_time: "2015-7-20 17:00", location: "Bryant Park", owner_id: 2)
    #   get :index
    #   expect(assigns(:games)).to match_array([game1, game2])
    # end
  end

  describe "GET #show" do
    it "assigns the requested game to @game" do
      get :show, id: game
      expect(assigns(:game)).to eq (game)
    end

    it "renders the game :show template" do
      get :show, id: game
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    it "assigns the requested game to @game" do
      get :edit, id: game
      expect(assigns(:game)).to eq game
    end

    it "renders the games :edit template" do
      get :edit, id: game
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new game in the database" do
        expect {
          post :create, game: game_attributes
          }.to change(Game, :count).by(1)
      end
    end
  end

  context "without valid attributes" do
    it "does not save the new game to the database" do
      expect {
        post :create, game: game_attributes_missing_sport
      }.to_not change(Game, :count)
    end
  end


  # describe "PATCH #update" do
  #   context "valid attributes" do
  #     it "locates the requested @user" do
  #       patch :update, id: user, user: user_attributes
  #       expect(assigns(:user)).to eq(user)
  #     end

  #     it "changes @user's attributes" do
  #       patch :update, id: user, user: user_attributes

  #       user.reload
  #       expect(user.full_name).to eq("Michael Bozza")
  #     end

  #     it "redirects to the updated user" do
  #       patch :update, id: user, user: user_attributes
  #       expect(response).to redirect_to user
  #     end
  #   end

  #   context "with invalid attributes" do
  #     it "does not change the user's attributes" do
  #       patch :update, id: user, user: user_attributes_invalid_password

  #       user.reload
  #       expect(user.full_name).to eq("Mike B")
  #     end

  #     it "re-renders the :edit template" do
  #       patch :update, id: user, user: user_attributes_invalid_password
  #       expect(response).to render_template :edit
  #     end
  #   end


  # end

  # describe 'DELETE #destroy' do
  #   before :each do
  #     @user = User.create(user_attributes)
  #   end

  #   it "deletes the user" do
  #     expect{
  #       delete :destroy, id: @user
  #     }.to change(User,:count).by(-1)
  #   end

  #   it "redirects to games#index" do
  #     delete :destroy, id: @user
  #     expect(response).to redirect_to root_path
  #   end
  # end
end



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
# end