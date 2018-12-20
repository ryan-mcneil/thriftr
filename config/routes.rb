Rails.application.routes.draw do

  get '/dashboard', to: 'dashboard#index'
  get '/results', to: 'results#index'

  root'welcome#index'

  get '/ynab', to: redirect("/auth/ynab"), as: '/ynab'
  get "/auth/ynab/callback", to: "users#create"

  get '/privacy', to: 'privacy#show'

  get '/register', to: 'users#new'
  get '/verify', to: 'verify#index'
  post '/verify', to: 'verify#create'

  resources :users, only: [:create, :update]
end
