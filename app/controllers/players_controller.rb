class PlayersController < ApplicationController
  def status
    player = Player.find(params[:id])
    player.attending = to_boolean(params[:status])
    player.save

    redirect_to user_path(params[:user_id])
  end

  def to_boolean(string)
    case string.downcase
    when 'true'
      return true
    when 'false'
      return false
    else
      return nil
    end
  end
end
