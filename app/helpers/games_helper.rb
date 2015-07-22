module GamesHelper
  def has_satisfactory_conditions?(game)
    if game.still_active? && Game.max_players_allowed(game.id) &&
      (game.status == false || game.invites.find_by(id: session[:user_id]))
    end
  end
end