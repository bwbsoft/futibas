class CreateGamesPlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :games_players do |t|
      t.references :game, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true

      t.integer :team, null: false, default: 0

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
