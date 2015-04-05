class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def draw
    draw = Draw.new(game_params[:risk]).call
    @place = draw[:place]
    @encounters = draw[:encounters]
  end

  def reward

  end

  private

  def game_params
    params.require(:game).permit(:risk)
  end
end
