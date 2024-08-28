# == Schema Information
#
# Table name: places
#
#  id         :bigint           not null, primary key
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
#
# Indexes
#
#  index_places_on_address        (address)
#  index_places_on_city           (city)
#  index_places_on_district       (district)
#  index_places_on_instagram      (instagram)
#  index_places_on_name           (name)
#  index_places_on_name_and_city  (name,city) UNIQUE
#  index_places_on_phone          (phone)
#  index_places_on_uf             (uf)
#  index_places_on_website        (website)
#
class Place < ApplicationRecord
end
