# == Schema Information
#
# Table name: games_players
#
#  id           :bigint           not null, primary key
#  absent       :boolean          default(FALSE)
#  assists      :integer          default(0)
#  goals        :integer          default(0)
#  impact       :decimal(3, 2)
#  mvp          :boolean          default(FALSE)
#  notes        :string
#  points       :integer          default(0)
#  red_cards    :integer          default(0)
#  saves        :integer          default(0)
#  team         :enum             default("no_team"), not null
#  yellow_cards :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  game_id      :bigint           not null
#  player_id    :bigint           not null
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
end
