class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.references :group, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true
      
      t.string :name, null: false, index: true
      t.string :nickname
      t.string :picture
      t.string :notes
      t.string :cpf, index: true, null: true

      t.string :phone, index: true
      t.string :email, index: true
      t.string :instagram, index: true

      t.integer :points, default: 0
      t.integer :consecutive_victories, default: 0
      t.integer :mvp_times, default: 0
      t.integer :biggest_impact_times, default: 0
      t.integer :goals, default: 0
      t.integer :assists, default: 0
      t.integer :saves, default: 0
      t.integer :yellow_cards, default: 0
      t.integer :red_cards, default: 0
      
      t.integer :matches_won, default: 0
      t.integer :matches_lost, default: 0
      t.integer :matches_drawn, default: 0
      
      t.integer :matches_played, default: 0
      t.integer :absences, default: 0

      t.timestamps
    end

    add_index :players, [:group_id, :cpf], unique: true, where: 'cpf IS NOT NULL'
  end
end
