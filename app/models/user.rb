class User < ApplicationRecord
  include NormalizeCpf
  
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :cpf, presence: true, uniqueness: true
end
