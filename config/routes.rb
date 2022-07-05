Rails.application.routes.draw do

  resource :users
  post '/auth/login', to: 'authentication#login'

  resources :flowers
  resources :sightings
  get '/sightings/flower/:flower_id', to: 'sightings#get_by_flower'

end
