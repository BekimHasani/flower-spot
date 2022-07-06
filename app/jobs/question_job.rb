require 'net/http'
require 'URI'

class QuestionJob < ApplicationJob
  queue_as :default
  retry_on Timeout::Error, wait: 1.hours, attempts: 1 do
    puts "inside the callback"
  end

  def perform(sighting)
    uri = URI("https://opentdb.com/api.php?amount=1&category=25&difficulty=easy&type=boolean")
    res = Net::HTTP.get_response(uri)
    response = JSON.parse(res.body)

    if response['response_code'] == 0
      sighting.question = response['results'][0]['question']
      sighting.save
    end
  end
end
