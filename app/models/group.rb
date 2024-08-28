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
class Group < ApplicationRecord
  has_many :players, dependent: :restrict_with_error
  has_many :games, dependent: :restrict_with_error
  belongs_to :user
end
