class User < ActiveRecord::Base
  has_many :practice_memberships
  has_many :practices, through: :practice_memberships
  belongs_to :position
  belongs_to :personnel_manager, class_name: 'User'
  has_many :subordinates, class_name: 'User', foreign_key: 'personnel_manager_id'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, omniauth_providers: [:google_oauth2]

  royce_roles [ :employee, :admin ]

  validates :email, format: {
    with: /[A-Z0-9a-z]+@growthaccelerationpartners\.com/,
    message: "has invalid GAP account"
  }

  def password_required?
    new_record? ? false : super
  end

end
