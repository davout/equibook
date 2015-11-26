class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :horses

  validates :email,
    presence: true,
    uniqueness: true

  def to_label
    email
  end

end
