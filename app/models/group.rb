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
#  owner_id            :uuid             not null
#
# Indexes
#
#  index_groups_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
class Group < ApplicationRecord
  has_many :players, dependent: :restrict_with_error
  has_many :games, dependent: :restrict_with_error
  has_many :places, dependent: :restrict_with_error
  belongs_to :owner, class_name: 'User'
  
end
