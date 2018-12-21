Rails.application.routes.draw do

  get '/dashboard', to: 'dashboard#index'
  get '/results', to: 'results#index'

  root'welcome#index'

  get '/ynab', to: redirect("/auth/ynab"), as: '/ynab'
  get "/auth/ynab/callback", to: "register#index"

  get '/login', to: 'login#new'
  post '/login', to: "login#create"

  get '/privacy', to: 'privacy#show'

  get '/register', to: 'register#index'
  post '/register', to: 'register#create'

  resources :users, only: [:create, :update, :new]
end
