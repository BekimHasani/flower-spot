Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resource :users
  post '/auth/login', to: 'authentication#login'

  resources :flowers
  resources :sightings
  get '/sightings/flower/:flower_id', to: 'sightings#get_by_flower'

  resources :likes
end
