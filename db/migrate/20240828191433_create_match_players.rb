class CreateMatchPlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :match_players do |t|
      t.references :match, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true

      t.enum :team, enum_type: :match_teams, null: false, default: 'no_team'

      t.integer :goals, default: 0
      t.integer :assists, default: 0
      t.integer :saves, default: 0
      t.integer :yellow_cards, default: 0
      t.integer :red_cards, default: 0
      t.boolean :absent, default: false
      t.boolean :mvp, default: false
      t.decimal :impact, precision: 3, scale: 2

      t.string :notes
      t.integer :points, default: 0

      t.timestamps
    end
  end
end
