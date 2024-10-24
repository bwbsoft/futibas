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
end
