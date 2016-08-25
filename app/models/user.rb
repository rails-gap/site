class User < ActiveRecord::Base
  has_many :memberships
  has_many :practices, through: :memberships
  belongs_to :position
  belongs_to :personnel_manager, class_name: 'User'
  has_many :subordinates, class_name: 'User', foreign_key: 'personnel_manager_id'
  has_many :practice_leads, class_name: 'Practice', foreign_key: 'practice_lead_id'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, omniauth_providers: [:google_oauth2]

  royce_roles [
    :admin,
    :personnel_manager,
    :practice_lead,
    :video_editor,
    :guide_editor
  ]

  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, format: {
    with: /[A-Z0-9a-z]+@(growthaccelerationpartners|wearegap)\.com/,
    message: "has invalid GAP account"
  }

  scope :active, -> { where(active: 1) }
  scope :ordered, -> { order(:name, :last_name) }

  def password_required?
    new_record? ? false : super
  end

  def full_name
    "#{name} #{last_name}"
  end

  def personnal_manager_name
    personnel_manager.full_name if personnel_manager
  end

  def position_level
    "#{position.name} #{level}" if position
  end

  def profile_image
    image || 'default.png'
  end

  def profile_icon
    picture || 'default.png'
  end

end
