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

* Database creation::
  rake db:migrate

* How to run the test suite::
  all at once => 'bundle exec rspec'
  
* Services (job queues, cache servers)::
  Redis via sidekiq 
