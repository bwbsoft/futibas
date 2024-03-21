json.extract! player, :id, :group_id, :name, :notes, :phone, :level, :skills, :created_at, :updated_at
json.url player_url(player, format: :json)
