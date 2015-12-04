class Activity < ActiveRecord::Base

  belongs_to :user,
    dependent: :destroy

  belongs_to :horse,
    dependent: :destroy

  validates :horse, :user, :title,
    presence: true

end

