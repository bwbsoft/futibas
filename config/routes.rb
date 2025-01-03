Rails.application.routes.draw do
  mount MissionControl::Jobs::Engine => "/mission_control"
  
  devise_for :users, path: 'auth', controllers: {
    sessions: 'auth/sessions',
    registrations: 'auth/registrations',
    passwords: 'auth/passwords',
    confirmations: 'auth/confirmations',
    unlocks: 'auth/unlocks'
  }
  root to: 'dashboard#home'
  devise_scope :user do
    authenticated :user do
      root 'dashboard#home', as: :authenticated_root
    end
    
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
    
    get 'auth/sign_out', to: 'devise/sessions#destroy', as: :sign_out
  end
  # resources :matches
  # resources :players
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  # Defines the root path route ("/")
  
  draw :groups
  draw :public_data
  # resources :users
  resources :places
end
