class GamesController < ApplicationController
  def index
    @games = Game.all
    @user = User.new
  end

  def show
    @game = Game.find_by(id: params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      invites = User.find_or_create_user_accounts(params[:invites])

      invites.each { |player| Player.create(user_id: player.id, game_id:  @game.id) }

      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def edit
    @game = Game.find_by(id: params[:id])
  end

  def update
    @game = Game.find_by(id: params[:id])
    @game.update(game_params)
    if @game.save
      redirect_to game_path(@game)
    else
      render :edit
    end
  end

  def destroy
     @game = Game.find_by(id: params[:id])
     @game.destroy
     flash[:notice] = "Game successfully destroyed"
     redirect_to root_path
  end

private

  def game_params
    params.require(:game).permit(:sport, :start_time, :end_time, :location, :owner_id)
  end
end