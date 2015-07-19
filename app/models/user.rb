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

  def self.find_or_create_user_accounts(username_or_email_list)
    return [] if username_or_email_list.nil?

    indentifiers = username_or_email_list.split(',')
    result = []

    indentifiers.each do |indentifier|
      indentifier.strip!

      if indentifier.include?('@')
        result << find_or_create_email(indentifier)
      else
        user = User.find_by(username: indentifier)
        result << user unless user.nil?
      end
    end

    return result
  end

  private

  def self.find_or_create_email(email)
    user = User.find_by(email: email)

    if user
      return user
    else
      username = generate_temporary_username

      return User.create(first_name: "temporary", last_name: "account", username: username, password: "123456", email: email, phone_number: "000-000-0000")
    end
  end

  def self.generate_temporary_username
    return "account1" if User.last.nil?

    return "account#{User.last.id + 1}"
  end
end
