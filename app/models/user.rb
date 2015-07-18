class User < ActiveRecord::Base
  has_secure_password
  has_many :created_games, foreign_key: :owner_id, class_name: 'Game'
  has_many :players
  has_many :games, through: :players

  validates_presence_of :email, :username, :password, :first_name, :last_name
  validates_length_of :password, minimum: 6
  validates_uniqueness_of :username, :email

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def self.get_or_create_user_accounts

  end
end
