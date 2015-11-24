class Horse < ActiveRecord::Base

  belongs_to :gender
  belongs_to :color

  validates :gender, presence: true
  validates :color, presence: true

end
