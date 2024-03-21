class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.references :place, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.timestamp :date
      t.string :notes
      t.integer :winner
      t.integer :team1_score
      t.integer :team2_score

      t.timestamps
    end
  end
end
