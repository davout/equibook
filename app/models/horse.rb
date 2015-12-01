class Horse < ActiveRecord::Base

  CATEGORIES = [
    [1000, :cheval_de_troie],
    [100, :chti_poney],
    [10, :mini_poney],
    [0, :nain]
  ]

  belongs_to :gender
  belongs_to :color

  has_and_belongs_to_many :users

  validates :name, :gender, :color, :birth,
    presence: true

  def category
    (height && CATEGORIES.find { |c| height >= c[0] }[1]) || :unknown
  end

end

