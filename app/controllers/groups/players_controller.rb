class Groups::PlayersController < ApplicationController
  before_action :set_player, only: %i[ show ]

  # GET /groups/:id/players/:id
  def show
    render 'groups/players/show'
  end

  private
  def set_player
    @player = Player.find(params[:player_id])
  end
end