require 'rails_helper'

describe UsersController do
  let(:user) do
    User.create(first_name: "mike", last_name: "b", username: "mikeb", password: "123456", email: "mike@example.com", phone_number: "011-345-6789")
  end

  let(:user2) do
    User.create(first_name: "Mike", last_name: "Branch", username: "mikeb2", password: "123456", email: "mikebranch@example.com", phone_number: "432-544-3463")
  end

  before :each do
    def user_attributes
      {first_name: "michael", last_name: "bozza", username: "mikeb", password: "123456", email: "mike@example.com", phone_number: "011-345-6789"}
    end

    def user_attributes_missing_username
      {first_name: "mike", last_name: "b", password: "123456", email: "mike@example.com", phone_number: "011-345-6789"}
    end

    def user_attributes_invalid_password
      {first_name: "michael", last_name: "bozza", username: "mikeb", password: "123", email: "mike@example.com", phone_number: "011-345-6789"}
    end

    def duplicate_username
      {first_name: "Mike", last_name: "Branch", username: "mikeb", password: "123456", email: "mikebranch@example.com", phone_number: "432-544-3463"}
    end

    def duplicate_email
      {first_name: "Michael", last_name: "Branch", username: "mikebranch", password: "123456", email: "mike@example.com", phone_number: "653-254-7889"}
    end
  end

  describe "GET #new" do
    it "assigns a new User to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #show" do
    it "assigns the requested user to @user" do
      get :show, id: user
      expect(assigns(:user)).to eq (user)
    end

    it "renders the :show template" do
      get :show, id: user
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    it "assigns the requested user to @user" do
      get :edit, id: user
      expect(assigns(:user)).to eq user
    end

    it "renders the :edit template" do
      get :edit, id: user
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new user in the database" do
        expect {
          post :create, user: user_attributes
          }.to change(User, :count).by(1)
      end

      it "redirects to users#show" do
        post :create, user: user_attributes
        expect(response).to redirect_to root_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new user to the database" do
        expect {
          post :create, user: user_attributes_missing_username
        }.to_not change(User, :count)
      end

      it "does not save the new user to the database" do
        expect {
          post :create, user: user_attributes_invalid_password
        }.to_not change(User, :count)
      end

      it "does not save if username already exist" do
        expect {
          user

          post :create, user: duplicate_username
        }.to change(User, :count).by(1)
      end

      it "does not save if email already exist" do
        expect {
          user

          post :create, user: duplicate_email
        }.to change(User, :count).by(1)
      end
    end
  end

  describe "PATCH #update" do
    context "valid attributes" do
      it "locates the requested @user" do
        patch :update, id: user, user: user_attributes
        expect(assigns(:user)).to eq(user)
      end

      it "changes @user's attributes" do
        patch :update, id: user, user: user_attributes

        user.reload
        expect(user.full_name).to eq("Michael Bozza")
      end

      it "redirects to the updated user" do
        patch :update, id: user, user: user_attributes
        expect(response).to redirect_to user
      end
    end

    context "with invalid attributes" do
      it "does not change the user's attributes" do
        patch :update, id: user, user: user_attributes_invalid_password

        user.reload
        expect(user.full_name).to eq("Mike B")
      end

      it "re-renders the :edit template" do
        patch :update, id: user, user: user_attributes_invalid_password
        expect(response).to render_template :edit
      end

      it "does not change username, when the username already exist" do
        user
        patch :update, id: user2, user: duplicate_username

        user2.reload
        expect(user2.username).to eq("mikeb2")
      end

      it "does not change email, when the email already exist" do
        user
        patch :update, id: user2, user: duplicate_email

        user2.reload
        expect(user2.email).to eq("mikebranch@example.com")
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @user = User.create(user_attributes)
    end

    it "deletes the user" do
      expect{
        delete :destroy, id: @user
      }.to change(User,:count).by(-1)
    end

    it "redirects to games#index" do
      delete :destroy, id: @user
      expect(response).to redirect_to root_path
    end
  end
end
