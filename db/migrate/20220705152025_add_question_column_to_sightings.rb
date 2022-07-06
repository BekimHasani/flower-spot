class AddQuestionColumnToSightings < ActiveRecord::Migration[6.0]
  def change
    add_column :sightings, :question, :string
  end
end
