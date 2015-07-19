class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  def self.attending_count(game_id)
    Player.where(game_id: game_id, attending: true).count
  end

  def is_attending?
    if self.attending
      return "Attending"
    else
      return "Not Attending"
    end
  end
end
