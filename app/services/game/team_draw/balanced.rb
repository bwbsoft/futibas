class Game::TeamDraw::Balanced
  def initialize(game)
    @game = game
  end

  def call
    sort_teams
  end

  private
  def sort_teams
    @game.game_players.shuffle.each.with_index do |game_player, index|
      game_player.update!(team: index.even? ? :a : :b)
    end
  end
end