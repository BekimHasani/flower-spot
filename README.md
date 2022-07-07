# README

Things you may want to cover:

* Version::
  ruby version 2.7.5,
  rails version 6.0.5,
  
  
* System dependencies::
  gem 'rspec-rails',
  gem 'factory_bot_rails',
  gem 'jwt',
  gem 'bcrypt',
  gem 'pg',
  gem 'sidekiq',
  gem 'whenever',
 
* Configuration::
  rails active_storage:install
  Run => 'bundle install' in the app root to install all required dependecies in order to run the application.
  
* to run the application::
  'rails s' to start the applications 
  'sidekiq' to start the sidekiq server 

* public api
  POST http://localhost:3000/users required params: email, username, password
  POST http://localhost:3000/auth/login required params: email, password
  GET  http://localhost:3000/flowers
  GET http://localhost:3000/sights
  GET http://localhost:3000/sightings/flower/:id
  
* authorized apis
  POST http://localhost:3000/sightings required params: longitude, latitude, user_id, flower_id,
  POST http://localhost:3000/likes required params: user_id, flower_id,
  DELETE http://localhost:3000/sightings/:id
  DELETE http://localhost:3000/likes/:id

* Database creation::
  rake db:migrate

* How to run the test suite::
  all at once => 'bundle exec rspec'
  
* Services (job queues, cache servers)::
  Redis via sidekiq 
