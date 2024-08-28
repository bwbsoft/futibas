# == Schema Information
#
# Table name: groups
#
#  id                  :uuid             not null, primary key
#  discord_webhook_url :string
#  name                :string           not null
#  notes               :string
#  picture             :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :uuid
#
# Indexes
#
#  index_groups_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
