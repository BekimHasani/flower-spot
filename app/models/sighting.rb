class Sighting < ApplicationRecord
  belongs_to :user
  belongs_to :flower
  has_one_attached :image

  validates :longitude, presence: true
  validates :latitude, presence: true

  before_destroy :is_the_owner?
  # after_create_commit :do_something
  # after_commit :do_something, :on => :create

  private

  def is_the_owner?
    return if self.user_id == Current.user[:id]
    errors[:base] << "A sighting can be destroyed only by the owner!"
    throw :abort
  end
end
