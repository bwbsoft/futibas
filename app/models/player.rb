# == Schema Information
#
# Table name: players
#
#  id                    :uuid             not null, primary key
#  absences              :integer          default(0)
#  assists               :integer          default(0)
#  average               :decimal(5, 2)    default(0.0)
#  consecutive_victories :integer          default(0)
#  cpf                   :string
#  email                 :string
#  goals                 :integer          default(0)
#  highlights            :integer          default(0)
#  instagram             :string
#  matches_drawn         :integer          default(0)
#  matches_lost          :integer          default(0)
#  matches_played        :integer          default(0)
#  matches_won           :integer          default(0)
#  name                  :string           not null
#  nickname              :string
#  notes                 :string
#  phone                 :string
#  picture               :string
#  points                :integer          default(0)
#  red_cards             :integer          default(0)
#  saves                 :integer          default(0)
#  yellow_cards          :integer          default(0)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  group_id              :uuid             not null
#  user_id               :uuid
#
# Indexes
#
#  index_players_on_cpf               (cpf)
#  index_players_on_email             (email)
#  index_players_on_group_id          (group_id)
#  index_players_on_group_id_and_cpf  (group_id,cpf) UNIQUE WHERE (cpf IS NOT NULL)
#  index_players_on_instagram         (instagram)
#  index_players_on_name              (name)
#  index_players_on_phone             (phone)
#  index_players_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (user_id => users.id)
#
class Player < ApplicationRecord
  belongs_to :group
  has_many :game_data, class_name: 'GamePlayer', dependent: :restrict_with_error
  has_many :games, through: :game_data
  has_and_belongs_to_many :tags
  
  validates :cpf, uniqueness: true, allow_nil: true

  def rating
    @rating ||= begin
      rating_data = GamePlayer.finished.where(player: self).limit(3)
      return 0 if rating_data.nil?
      (rating_data.pluck(:points).sum / rating_data.size.to_f).round(2)
    end
  end
end
