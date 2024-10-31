# == Schema Information
#
# Table name: games_players
#
#  id            :bigint           not null, primary key
#  absent        :boolean          default(FALSE)
#  assists       :integer          default(0)
#  goals         :integer          default(0)
#  highlight     :boolean          default(FALSE)
#  is_goalkeeper :boolean          default(FALSE)
#  notes         :string
#  points        :integer          default(0)
#  result        :integer          default(0)
#  saves         :integer          default(0)
#  team          :integer          default("no_team"), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  game_id       :uuid             not null
#  player_id     :uuid             not null
#
# Indexes
#
#  index_games_players_on_game_id    (game_id)
#  index_games_players_on_player_id  (player_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_id => games.id)
#  fk_rails_...  (player_id => players.id)
#
class GamePlayer < ApplicationRecord
  self.table_name = 'games_players'

  belongs_to :game
  belongs_to :player

  enum team: [:no_team, :a, :b], _default: :no_team
  enum result: [:pending, :win, :draw, :loss], _default: :pending

  def apply_stats
    if team == :no_team
      player.absences = (player.absences + 1)
      update(absent: true)
      player.save
      return
    end
    player.saves = saves
    player.goals = goals
    player.assists = assists
    player.highlights = (player.highlights + 1) if highlight
    player.points = highlight ? (player.points + points + 1) : (player.points + points)
    player.matches_played = (player.matches_played + 1)
    if result == 'win'
      player.matches_won = (player.matches_won + 1)
      player.consecutive_victories = (player.consecutive_victories + 1)
    else
      player.consecutive_victories = 0
    end
    player.matches_drawn = (player.matches_drawn + 1) if result == 'draw'
    player.matches_lost = (player.matches_lost + 1) if result == 'loss'
    player.average = (player.points.to_d / player.matches_played.to_d)
    player.save
  end
end
