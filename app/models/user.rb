class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, omniauth_providers: [:facebook]

  has_and_belongs_to_many :horses

  has_many :images

  validates :email,
    presence: true,
    uniqueness: true

  def to_label
    name || email
  end

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email.downcase).first ||
      where(provider: auth.provider, uid: auth.uid).first_or_create

    user.email    = auth.info.email
    user.name     = auth.info.name
    user.fb_image = auth.info.image
    user.provider = auth.provider
    user.uid      = auth.uid

    if user.new_record?
      user.password = Devise.friendly_token[0,20]
    end

    user.save
    user
  end

end
