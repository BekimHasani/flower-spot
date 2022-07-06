class QuestionService
  def self.add_question
    @sightings = Sighting.where(:question => nil)
    @sightings.each do |sighting|
      QuestionJob.perform_now(sighting)
    end
  end
end