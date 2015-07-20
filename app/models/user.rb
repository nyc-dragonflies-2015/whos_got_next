class User < ActiveRecord::Base

  TEMPORARY_USER_CONFIGURATION = { first_name: "temporary", last_name: "account", password: "123456", phone_number: "000-000-0000" }

  has_secure_password
  has_many :created_games, foreign_key: :owner_id, class_name: 'Game'
  has_many :players
  has_many :invites, foreign_key: :user_id, class_name: 'Player'
  has_many :games, through: :players

  validates_presence_of :email, :username, :password, :first_name, :last_name
  validates_length_of :password, minimum: 6
  validates_uniqueness_of :username, :email

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def self.find_or_create_user_accounts(username_or_email_list)
    username_or_email_list.split(',').each_with_object([]) do |identifier, result|
      identifier.strip!
      if identifier.include?('@')
        result << find_or_create_email(identifier)
      else
        user = User.find_by(username: identifier)
        result << user unless user.nil?
      end
    end
  end

  private

  def self.find_or_create_email(email)
    user = User.find_by(email: email)

    if user
      return user
    else
      username = generate_temporary_username
      return User.create(TEMPORARY_USER_CONFIGURATION.merge({username: username, email:email}))
    end
  end

  def self.generate_temporary_username
    return "account1" if User.last.nil?

    return "account#{User.last.id + 1}"
  end
end