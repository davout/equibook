class Horse < ActiveRecord::Base

  belongs_to :gender
  belongs_to :color

  has_and_belongs_to_many :users

  validates :name, :gender, :color, :birth,
    presence: true

end

