Rails.application.routes.draw do

  get '/dashboard', to: 'dashboard#index'
  get '/results', to: 'results#index'

  root'welcome#index'

  get '/ynab', to: redirect("/auth/ynab"), as: '/ynab'
  get "/auth/ynab/callback", to: "register#index"

  get '/login', to: 'login#new'
  post '/login', to: "login#create"
  delete '/logout', to: "login#destroy"

  get '/privacy', to: 'privacy#show'

  get '/register', to: 'register#index'
  post '/register', to: 'register#create'

  get 'verification/:id/edit', to: 'verification#edit', as: 'edit_verification'
  patch '/verification/:id', to: 'verification#update', as: 'verification'

  get '/preferences', to: 'preferences#index'
  put '/preferences', to: 'preferences#update'

  get '/phone', to: 'phone#index'

  resources :users, only: [:create, :update, :new, :edit, :update]
end
