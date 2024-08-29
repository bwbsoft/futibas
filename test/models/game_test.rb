# == Schema Information
#
# Table name: games
#
#  id                 :bigint           not null, primary key
#  date               :datetime
#  notes              :string
#  status             :integer          default("scheduled")
#  team_a_score       :integer          default(0)
#  team_b_score       :integer          default(0)
#  title              :string           not null
#  winner_team        :enum             default("no_team"), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  greatest_impact_id :bigint
#  group_id           :uuid             not null
#  mvp_id             :bigint
#  place_id           :bigint           not null
#  user_id            :uuid             not null
#
# Indexes
#
#  index_games_on_greatest_impact_id  (greatest_impact_id)
#  index_games_on_group_id            (group_id)
#  index_games_on_mvp_id              (mvp_id)
#  index_games_on_place_id            (place_id)
#  index_games_on_title               (title)
#  index_games_on_user_id             (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (greatest_impact_id => players.id)
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (mvp_id => players.id)
#  fk_rails_...  (place_id => places.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
