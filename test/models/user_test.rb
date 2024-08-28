# == Schema Information
#
# Table name: users
#
#  id              :uuid             not null, primary key
#  cpf             :string
#  email           :string           not null
#  instagram       :string
#  name            :string           not null
#  password_digest :string           not null
#  phone           :string
#  picture         :string
#  role            :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_cpf        (cpf) UNIQUE
#  index_users_on_email      (email) UNIQUE
#  index_users_on_instagram  (instagram)
#  index_users_on_phone      (phone)
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
