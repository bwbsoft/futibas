resources :groups, param: :group_id do
  member do
    get 'settings', action: :settings
    get 'ranking', action: :ranking

    resources :games, controller: 'groups/games', param: :game_id, as: 'group_games' do
      member do
        post 'proccess', action: :proccess, as: 'proccess'
        post 'sort_teams', action: :sort_teams, as: 'sort_teams'

        post 'set_team_score/:team/:goals', action: :set_team_score, as: 'set_team_score'
        post 'set_player_data/:player_id', action: :set_player_data, as: 'set_player_data'
        
        post 'add_player/:player_id', action: :add_player, as: 'add_player'
        delete 'remove_player/:player_id', action: :remove_player, as: 'remove_player'

        post 'set_player_team/:player_id/:team', action: :set_player_team, as: 'set_player_team'
      end
    end

    resources :players, controller: 'groups/players', param: :player_id, as: 'group_players'
  end
end