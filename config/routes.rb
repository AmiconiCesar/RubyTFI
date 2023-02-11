Rails.application.routes.draw do
  root to: "home#index"

  get "/home", to: "home#index", as: "home"
 
  get '/turns/:id/attend', to: 'turns#attend', as: 'attend_turn'

  resources :users
  resources :turns
  resources :bank_branches do
      resources :schedules
  end    
  resources :localities
  resources :sessions, only: [:new, :create, :destroy] 
end
