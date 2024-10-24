# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  cpf                    :string
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           not null
#  encrypted_password     :string           default(""), not null
#  instagram              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  name                   :string           not null
#  phone                  :string
#  picture                :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default("player")
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_cpf                   (cpf) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_instagram             (instagram)
#  index_users_on_phone                 (phone)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  include NormalizeCpf

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  enum role: { player: 0, admin: 1 }

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true

  has_many :owned_groups, class_name: 'Group', foreign_key: 'owner_id',  dependent: :restrict_with_error

  def groups
    owned_groups
  end
end
