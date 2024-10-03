resources :groups do
  member do 
    resources :games, controller: 'groups/games', only: %i[ show ], param: :game_id, as: 'group_games'
    resources :players, controller: 'groups/players', param: :player_id, as: 'group_players'
  end
end