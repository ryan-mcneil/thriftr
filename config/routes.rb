Rails.application.routes.draw do

  get '/dashboard', to: 'dashboard#index'
  get '/results', to: 'results#index'

  root'welcome#index'

  get '/ynab', to: redirect("/auth/ynab"), as: '/ynab'
  get "/auth/ynab/callback", to: "login#create"

  get '/login', to: 'login#new'

  get '/privacy', to: 'privacy#show'

  get '/register', to: 'register#index'
  post '/register', to: 'register#create'

  resources :users, only: [:create, :update, :new]
end
