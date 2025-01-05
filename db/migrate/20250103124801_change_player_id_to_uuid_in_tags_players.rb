class ChangePlayerIdToUuidInTagsPlayers < ActiveRecord::Migration[7.2]
  def update
    change_column :tags_players, :player_id, :uuid, using: 'player_id::text::uuid'
  end
end
