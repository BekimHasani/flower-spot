class Sighting < ApplicationRecord
  belongs_to :user
  belongs_to :flower
  has_one_attached :image

  validates :longitude, presence: true
  validates :latitude, presence: true
end
