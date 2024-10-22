class Groups::GamesController < GroupsControllerBase
  before_action :set_game, only: %i[ show add_player remove_player set_player_team sort_teams]
  before_action :set_group

  def index
    @games = @group.games
    render 'groups/games/index' 
  end
  
  # GET /groups/:id/games/:id
  def show
    render 'groups/games/show'
  end

  def add_player
    @player = Player.find(params[:player_id])
    unless @game.players.include?(@player)
      @game.game_players.create(player_id: @player.id) 

      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace("game_players_#{@game.group.id}", partial: 'groups/games/players_list', locals: { players: @game.players }),
            turbo_stream.replace("game_players_selector_#{@game.group.id}", partial: 'groups/games/players_selector', locals: { group: @group, game: @game })
          ]
        end
        format.json { head :ok }
      end
    else
    end

    
  end

  def remove_player
    @game.game_players.where(player_id: params[:player_id]).destroy_all
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace("game_players_#{@game.group.id}", partial: 'groups/games/players_list', locals: { players: @game.players }),
          turbo_stream.replace("game_players_selector_#{@game.group.id}", partial: 'groups/games/players_selector', locals: { group: @group, game: @game })
        ]
      end
      format.json { head :ok }
    end
  end

  def set_player_team
    @game.game_players.where(player_id: params[:player_id]).update(team: params[:team])
    respond_to do |format|
      render turbo_stream: [
        turbo_stream.replace("game_players_#{@game.group.id}", partial: 'groups/games/players_list', locals: { players: @game.players }),
        turbo_stream.replace("game_players_selector_#{@game.group.id}", partial: 'groups/games/players_selector', locals: { group: @group, game: @game })
      ]
      format.json { head :ok }
    end
  end

  def sort_teams
    Game::TeamDraw::Balanced.new(@game).call
    respond_to do |format|
      format.turbo_stream do
        turbo_stream.replace("game_players_#{@game.group.id}", partial: 'groups/games/players_list', locals: { players: @game.players })
      end
      format.json { head :ok }
    end
  end

  private
  def set_game
    @game = Game.find(params[:game_id])
  end
end