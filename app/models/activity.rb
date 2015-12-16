class Activity < ActiveRecord::Base

  default_scope { order('id DESC') }

  # Used to sanitize activity description and prevent XSS
  SANITIZE_CONFIG_IMG = Sanitize::Config.merge(Sanitize::Config::BASIC, {
    elements:         Sanitize::Config::BASIC[:elements] + %w{ img },
    remove_contents:  true
  })

  # Used to keep only the formatted text
  SANITIZE_CONFIG_SUMMARY = Sanitize::Config.merge(Sanitize::Config::BASIC, {
    elements:         [],
    remove_contents:  false
  })

  SUMMARY_WORDCOUNT = 20

  belongs_to :user,
    dependent: :destroy

  belongs_to :horse,
    dependent: :destroy

  has_many :images,
    as: :imageable

  validates :horse, :user, :title,
    presence: true

  def description
    Sanitize.fragment(read_attribute(:description), SANITIZE_CONFIG_IMG)
  end

  def summary
    sanitized = Sanitize.fragment(read_attribute(:description), SANITIZE_CONFIG_SUMMARY)

    if sanitized.split(' ').count > SUMMARY_WORDCOUNT
      sanitized.gsub(/^\s*/, '').match(/^([^\s]+\s*){,#{SUMMARY_WORDCOUNT}}/)[0].gsub(/\s*$/, '') + '...'
    else
      sanitized
    end
  end

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

