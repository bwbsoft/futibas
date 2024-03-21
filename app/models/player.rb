class Player < ApplicationRecord
  belongs_to :group

  validates :name, presence: true
  validates :level, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }

  def self.skill_list
    [
      neutral: 'Nem fede nem cheira',
      goalkeeper: 'Goleiro',
      forward: 'Atacante',
      offensive: 'Jogador de Frente',
      defender: 'Zagueiro',
      deffensive: 'Defensor',
      finisher: 'Finalizador',
      scorer: 'Goleador',
      pass: 'Passe',
      dribble: 'Drible',
      midfielder: 'Meio',
      header: 'Cabeceio'
    ]
  end
end
