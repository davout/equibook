class Activity < ActiveRecord::Base

  belongs_to :user,
    dependent: :destroy

  belongs_to :horse,
    dependent: :destroy

  validates :horse, :user, :title,
    presence: true


  #
  # Returns +true+ if the activity can be edited by the provided user
  #
  # @param u [User] The user for which we check
  # @return [Boolean] Whether edit is allowed
  #
  def editable_by?(u)
    u && (u == self.user)
  end

end

