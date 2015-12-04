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

  has_and_belongs_to_many :users

  has_many :activities

  validates :name, :gender, :color, :birth, :owner,
    presence: true

  def category
    (height && CATEGORIES.find { |c| height >= c[0] }[1]) || :unknown
  end

end

