module GamesHelper
  def has_satisfactory_conditions?(game)
    game.still_active? && Game.max_players_allowed(game.id)
  end
end