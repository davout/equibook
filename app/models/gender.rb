class Gender < ActiveRecord::Base
  has_many :horses
  validates :name, presence: true
end
