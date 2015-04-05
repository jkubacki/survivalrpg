class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def draw
    draw = Draw.new(game_params[:risk]).call
    @place = draw[:place]
    @encounters = draw[:encounters]
    @risk = game_params[:risk]
  end

  def reward
    @rewards = DrawReward.new(params[:risk]).call
  end

  private

  def game_params
    params.require(:game).permit(:risk)
  end
end
