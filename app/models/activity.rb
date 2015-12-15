class Activity < ActiveRecord::Base

  default_scope { order('id DESC') }

  belongs_to :user,
    dependent: :destroy

  belongs_to :horse,
    dependent: :destroy

  has_many :images,
    as: :imageable

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

