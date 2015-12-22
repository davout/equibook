class Horse < ActiveRecord::Base

  CATEGORIES = [
    [1000, :cheval_de_troie],
    [100, :chti_poney],
    [10, :mini_poney],
    [0, :nain]
  ]

  belongs_to :gender
  belongs_to :color
  belongs_to :owner, class_name: :User
  has_and_belongs_to_many :riders, class_name: 'User'

  has_many :activities

  validates :name, :gender, :color, :birth, :owner,
    presence: true

  before_validation :add_owner_to_riders,
    on: :create

  def category
    (height && CATEGORIES.find { |c| height >= c[0] }[1]) || :unknown
  end

  def to_label
    (!nick.blank? && nick) || name
  end

  def age
    Date.today.year - birth.year - ((Date.today < birth + (Date.today.year - birth.year).years) ? 1 : 0)
  end

  def add_owner_to_riders
    riders << owner if (owner && !riders.include?(owner))
  end

end

