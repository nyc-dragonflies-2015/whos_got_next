class User < ActiveRecord::Base
  has_secure_password
  has_many :created_games, foreign_key: :owner_id, class_name: 'Game'
  has_many :players
  has_many :games, through: :players

  validates :email, presence: true
  validates :username, presence: true
  validates :password, presence: true
end
