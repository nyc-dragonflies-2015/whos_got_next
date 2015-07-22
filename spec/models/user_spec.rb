require 'rails_helper'

describe User do
  # let!(:user) { User.create(first_name: "mike", last_name: "b", username: "mikeb", password: "123456", email: "mike@example.com", phone_number: "011-345-6789") }

  # subject { User.new(first_name: 'John', last_name: 'Doe', email: 'john@example.com', phone_number: '555-555-5555', username: 'johndoe') }

  it { should have_many(:players) }
  it { should have_many(:games) }
  it { should have_many(:created_games) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  it { should validate_length_of(:password).is_at_least(6) }

  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:email) }

  describe "#full_name" do
    it "should return a user's full name capitalized" do
      expect(user.full_name).to eq('Mike B')
    end
  end

  describe "#find_or_create_user_accounts" do
    it "returns an array of users" do
      user.save
      accounts = User.find_or_create_user_accounts('mikeb, johndoe@gmail.com, janed, 182-334-2891')

      expect(accounts.class).to eq(Array)
      expect(accounts[0].class).to eq(User)
      expect(accounts[1].class).to eq(User)
      expect(accounts[2].class).to eq(User)
    end

    it "should not create a new account if the email or username already exist" do
      expect{
        accounts = User.find_or_create_user_accounts('mikeb, mike@example.com')
      }.not_to change(User, :count)
    end

    it "should not create a new account if the temporary phone number already exist" do
      expect{
        accounts = User.find_or_create_user_accounts('000-000-0000, 000-000-0000')
      }.to change(User, :count).by(1)
    end

    it "should not create a new account if the username doesn't exist" do
      expect{
        accounts = User.find_or_create_user_accounts('JessicaP')
      }.to_not change(User, :count)
    end

    it "should create a new account if the email doesn't exist" do
      expect{
        accounts = User.find_or_create_user_accounts('JohnS@example.com')
      }.to change(User, :count).by(1)
    end
  end
end
