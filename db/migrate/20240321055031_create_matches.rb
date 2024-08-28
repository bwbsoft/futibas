class CreateMatches < ActiveRecord::Migration[7.1]
  create_enum :match_teams, ['a', 'b', 'no_team']

  def change
    create_table :matches do |t|
      t.references :group, null: false, foreign_key: true
      t.references :place, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.status :status, default: 0
      
      t.title :name, null: false, index: true
      t.timestamp :date
      t.string :notes

      t.enum :winner_team, enum_type: :match_teams, null: false, default: 'no_team'
      t.integer :team_a_score, default: 0
      t.integer :team_b_score, default: 0

      t.references :mvp, null: true, foreign_key: { to_table: :players }
      t.references :greatest_impact, null: true, foreign_key: { to_table: :players }

      t.timestamps
    end
  end
end
