class Sighting < ApplicationRecord
  belongs_to :user
  belongs_to :flower
  has_one_attached :image

  validates :longitude, presence: true
  validates :latitude, presence: true

  before_destroy :is_the_owner?

  private

  def is_the_owner?
    return if self.user_id == Current.user[:id]
    errors[:base] << "A sight can be destroyed only by the owner!"
    throw :abort
  end
end
