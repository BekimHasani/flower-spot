# README

Things you may want to cover:
**All the commands should be run under the app root tree**

* Version::
  ruby version 2.7.5,
  rails version 6.0.5,
  
  
* System dependencies<br>
  gem 'rspec-rails',<br>
  gem 'factory_bot_rails',<br>
  gem 'jwt',<br>
  gem 'bcrypt',<br>
  gem 'pg',<br>
  gem 'sidekiq',<br>
  gem 'whenever',<br><br>
 
* Configuration<br>
  run 'rails active_storage:install'<br>
  run 'bundle install' in the app root to install all required dependencies in order to run the application.<br>
  run 'whenever --update-crontab' #if job doesn't get executed check you cron configuration in machine '<br>
  run 'rake db:seed'<br>
  run 'rake db:migrate'<br><br>
  
* Application run<br>
  'rails s' to start the applications <br>

* Database creation<br>
  run 'rake db:migrate'<br>

* How to run the test suite<br>
  run 'bundle exec rspec'<br>
  
* Services (job queues, cache servers)<br>
  Redis via sidekiq for storing jobs<br>
  
* Public api<br>
  POST http://localhost:3000/users required params: email, username, password<br>
  POST http://localhost:3000/auth/login required params: email, password<br>
  GET  http://localhost:3000/flowers<br>
  GET http://localhost:3000/sights<br>
  GET http://localhost:3000/sightings/flower/:id<br>
  
* authorized apis<br>
  POST http://localhost:3000/sightings required params: longitude, latitude, user_id, flower_id,<br>
  POST http://localhost:3000/likes required params: user_id, flower_id,<br>
  DELETE http://localhost:3000/sightings/:id<br>
  DELETE http://localhost:3000/likes/:id<br>
