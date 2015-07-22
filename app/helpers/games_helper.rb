module GamesHelper
  def has_satisfactory_conditions?(game)
    if game.still_active? && Game.max_players_allowed(game.id) && (game.private_game || game.invites.find_by(id: session[:user_id]))
      return true
    else
      return false
    end
  end

  def is_game_private?(game)
    game.private_game ? "Private" : "Public"
  end
end