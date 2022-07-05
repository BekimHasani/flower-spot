class Like < ApplicationRecord
  belongs_to :user
  belongs_to :sighting

  before_destroy :is_the_owner?

  def is_the_owner?
    return if self.user_id == Current.user[:id]
    errors[:base] << "A like can be revert only by the owner!"
    throw :abort
  end
end
