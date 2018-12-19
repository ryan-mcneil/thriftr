Rails.application.routes.draw do

  root 'welcome#index'

  get '/ynab', to: redirect("/auth/ynab"), as: '/ynab'
  get "/auth/ynab/callback", to: "users#create"

  get '/privacy', to: 'privacy#show'

  get '/register', to: 'users#new'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
