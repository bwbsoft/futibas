class Game::Proccess
  WIN_POINTS = 3
  DRAW_POINTS = 1
  LOSE_POINTS = -1

  def initialize(game)
    @game = game
  end

  def call
    return if @game.processing? || @game.finished?
    @game.update(status: :processing)
    set_winner_team
    set_game_status
    if @game.save
      set_players_points
      update_players
    end
  end

  private
  def set_winner_team
    if @game.team_a_score == @game.team_b_score
      @game.winner_team = :no_team
    elsif @game.team_a_score > @game.team_b_score
      @game.winner_team = :a
    else
      @game.winner_team = :b
    end
  end

  def set_game_status
    @game.status = :finished
  end

  def set_players_points
    if @game.winner_team == :no_team
      @game.game_players.each do |game_player|
        game_player.update(result: :draw, points: DRAW_POINTS)
      end
    else
      @game.game_players.each do |game_player|
        if game_player.team == @game.winner_team
          game_player.update(result: :win, points: WIN_POINTS)
        else
          game_player.update(result: :loss, points: LOSE_POINTS) unless game_player.is_goalkeeper
        end
      end
    end
  end

  def update_players
    @game.game_players.each do |game_player|
      game_player.apply_stats
    end
  end
end