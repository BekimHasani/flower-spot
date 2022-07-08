namespace :questions do
  desc "TODO"
  task set_question: :environment do
    QuestionService.add_question
  end
end
