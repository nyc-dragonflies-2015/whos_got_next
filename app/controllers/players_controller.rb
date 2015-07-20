class PlayersController < ApplicationController
  def status
    invite = PlayersController.find_or_create_invite(invite_id: params[:invite_id], game_id: params[:game_id], user_id: session[:user_id])
    invite.update(attending: PlayersController.to_boolean(params[:status]))

    redirect_to user_path(session[:user_id])
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

  def self.find_or_create_invite(args)
    invite = Player.find_by(id: args[:invite_id])

    if invite
      return invite
    else
      return Player.create(game_id: args[:game_id], user_id: args[:user_id])
    end
  end
end
