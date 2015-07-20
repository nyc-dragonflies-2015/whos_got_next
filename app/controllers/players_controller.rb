class PlayersController < ApplicationController
  def status
    invite = find_or_create_invite(params[:id], params[:game_id])
    invite.update(attending: params[:status])

    redirect_to user_path(params[:user_id])
  end

  private

  def self.to_boolean(string)
    case string.downcase
    when 'true'
      return true
    when 'false'
      return false
    else
      return nil
    end
  end

  def find_or_create_invite(invite_id, game_id)
    invite = Player.find_by(id: invite_id)

    if invite
      return invite
    else
      Player.create(game_id: game_id, user_id: session[:user_id])
    end
  end
end
