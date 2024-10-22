resources :groups, param: :group_id do
  member do 
    resources :games, controller: 'groups/games', param: :game_id, as: 'group_games' do
      member do
        post 'sort_teams', action: :sort_teams, as: 'sort_teams'
        
        post 'add_player/:player_id', action: :add_player, as: 'add_player'
        delete 'remove_player/:player_id', action: :remove_player, as: 'remove_player'

        post 'set_player_team/:player_id/:team', action: :set_player_team, as: 'set_player_team'
      end
    end

    resources :players, controller: 'groups/players', param: :player_id, as: 'group_players'
  end
end