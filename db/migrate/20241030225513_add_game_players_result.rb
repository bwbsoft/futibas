class AddGamePlayersResult < ActiveRecord::Migration[7.2]
  def change
    add_column :games_players, :result, :integer, default: 0
  end
end
