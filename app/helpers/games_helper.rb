module GamesHelper
  def has_satisfactory_conditions?(game)
    game.still_active? && Game.max_players_allowed(game.id) && (game.private_game == false || game.invites.find_by(user_id: session[:user_id]))
  end

  def is_game_private?(game)
    game.private_game ? "Private" : "Public"
  end
end