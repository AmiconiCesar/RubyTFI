Rails.application.routes.draw do
  root to: "home#index"

  get "/home", to: "home#index", as: "home"
  get "/logout", to: "session#logout"

  resources :users
  resources :turns
  resources :bank_branches do
      resources :schedules
  end    
  resources :localities
  resources :sessions, only: [:new, :create] 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
