# == Schema Information
#
# Table name: places
#
#  id         :uuid             not null, primary key
#  address    :string
#  city       :string
#  district   :string
#  instagram  :string
#  name       :string
#  phone      :string
#  uf         :string
#  website    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :uuid             not null
#
# Indexes
#
#  index_places_on_address            (address)
#  index_places_on_city               (city)
#  index_places_on_district           (district)
#  index_places_on_group_id           (group_id)
#  index_places_on_group_id_and_name  (group_id,name) UNIQUE
#  index_places_on_instagram          (instagram)
#  index_places_on_name               (name)
#  index_places_on_phone              (phone)
#  index_places_on_uf                 (uf)
#  index_places_on_website            (website)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#
class Place < ApplicationRecord
  belongs_to :group

  has_many :games, dependent: :restrict_with_error

  validates :name, presence: true
  validates :name, uniqueness: { scope: :group_id }
end
