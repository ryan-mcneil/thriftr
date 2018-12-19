Rails.application.routes.draw do

  root 'welcome#index'

  get '/ynab', to: redirect("/ynab/auth"), as: '/ynab'
  get "/auth/:provider/callback", to: "user#create"

  get '/privacy', to: 'privacy#show'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
