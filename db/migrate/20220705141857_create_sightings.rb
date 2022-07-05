class CreateSightings < ActiveRecord::Migration[6.0]
  def change
    create_table :sightings do |t|
      t.string :longitude, null: false
      t.string :latitude, null: false
      t.references :user, null: false, foreign_key: true
      t.references :flower, null: false, foreign_key: true

      t.timestamps
    end
  end
end
