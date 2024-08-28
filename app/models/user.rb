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
class User < ApplicationRecord
  include NormalizeCpf
  
  has_secure_password

  enum role: { player: 0, admin: 1 }

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :cpf, presence: true, uniqueness: true

  has_many :groups, dependent: :restrict_with_error
end
