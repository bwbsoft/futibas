class CreateJoinTableTagsPlayers < ActiveRecord::Migration[7.2]
  def change
    create_join_table :tags, :players
  end
end
