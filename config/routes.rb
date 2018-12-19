Rails.application.routes.draw do

  get '/dashboard', to: 'dashboard#index'
  get '/results', to: 'results#index'
end
