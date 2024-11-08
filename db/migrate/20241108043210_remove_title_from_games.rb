class RemoveTitleFromGames < ActiveRecord::Migration[7.2]
  def change
    remove_column :games, :title
  end
end
