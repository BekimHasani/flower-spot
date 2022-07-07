# Use this file to easily define all of your cron jobs.
set :output, "log/cron_log.log"
set :environment, "development"

every 2.minutes do
  rake "questions:set_question"
end