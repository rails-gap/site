class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, omniauth_providers: [:google_oauth2]

  validates :email, format: {
    with: /[A-Z0-9a-z]+@growthaccelerationpartners\.com/,
    message: "Please login with your GAP account"
  }

  def self.from_omniauth(auth)
    if auth.info.email.include?('@growthaccelerationpartners.com')
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.name = auth.info.name
        user.password = Devise.friendly_token[0, 20]
      end
    end
  end

end
