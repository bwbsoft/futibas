# == Schema Information
#
# Table name: tags
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  group_id    :uuid             not null
#
# Indexes
#
#  index_tags_on_group_id  (group_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#
class Tag < ApplicationRecord
  belongs_to :group
  has_and_belongs_to_many :players

  validates :name, presence: true
end
