require 'rails_helper'

describe User do
  let!(:user) { User.create(first_name: "mike", last_name: "b", username: "mikeb", password: "123456", email: "mike@example.com", phone_number: "011-345-6789") }

  subject { User.new(first_name: 'John', last_name: 'Doe', email: 'john@example.com', phone_number: '555-555-5555', username: 'johndoe') }

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

  it "#find_or_create_user_accounts returns an array of user accounts" do
    user.save
    accounts = User.find_or_create_user_accounts('mikeb, johndoe@gmail.com, janed')

    expect(accounts.count).to eq(2)
  end

  it "#find_or_create_user_accounts create user accounts for emails" do
    expect{
      accounts = User.find_or_create_user_accounts('mikeb, johndoe@gmail.com, johndoe@gmail.com, janed')
    }.to change(User,:count).by(1)
  end
end
