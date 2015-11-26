class Color < ActiveRecord::Base

  has_many :horses

  validates :name, presence: true

end

