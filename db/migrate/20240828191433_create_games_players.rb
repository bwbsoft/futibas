class CreateGamesPlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :games_players do |t|
      t.references :game, null: false, foreign_key: true, type: :uuid
      t.references :player, null: false, foreign_key: true, type: :uuid

      t.integer :team, null: false, default: 0

      t.boolean :is_goalkeeper, default: false
      t.boolean :absent, default: false
      t.boolean :highlight, default: false

      t.integer :goals, default: 0
      t.integer :assists, default: 0
      t.integer :saves, default: 0

      t.string :notes
      
      t.integer :points, default: 0

      t.timestamps
    end
  end
end
