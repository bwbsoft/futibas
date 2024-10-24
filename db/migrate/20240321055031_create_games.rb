class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games, id: :uuid do |t|
      t.references :group, null: false, foreign_key: true, type: :uuid
      t.references :place, null: false, foreign_key: true, type: :uuid
      t.references :owner, null: false, foreign_key: { to_table: :users }, type: :uuid

      t.integer :status, default: 0
      
      t.string :title, null: false, index: true
      t.timestamp :date
      t.string :notes

      t.integer :winner_team, null: false, default: 0
      t.integer :team_a_score, default: 0
      t.integer :team_b_score, default: 0

      t.timestamps
    end
  end
end
