class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show

  end

  def new
    @game = Game.new
  end

  def edit

  end

  def update

  end

  def destroy

  end
end