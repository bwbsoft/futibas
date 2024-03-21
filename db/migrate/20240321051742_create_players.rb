class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.references :group, null: false, foreign_key: true
      t.string :name, null: false, index: true
      t.string :notes
      t.string :phone, index: true
      t.integer :level, default: 5, limit: 2
      t.jsonb :skills, default: []

      t.timestamps
    end
  end
end
