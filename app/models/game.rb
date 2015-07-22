class Game < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :players
  has_many :invites, foreign_key: :game_id, class_name: 'Player'
  has_many :users, through: :players

  validates_presence_of :sport, :start_time, :location

  def still_active?
    self.start_time > Time.now
  end

  def self.max_players_allowed(game_id)
    Player.attending_count(game_id) < 10
  end

  def user_status(user_id)
    invite = self.invites.find_by(user_id: user_id)

    if invite && invite.attending
      return 'Attending'
    else
      return 'Not Attending'
    end
  end
end
