class Groups::GamesController < ApplicationController
  before_action :set_game, only: %i[ show ]

  # GET /groups/:id/games/:id
  def show
    render 'groups/games/show'
  end

  private
  def set_game
    @game = Game.find(params[:game_id])
  end
end