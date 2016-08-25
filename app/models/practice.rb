class Practice < ActiveRecord::Base
  has_many :practice_memberships
  has_many :members, through: :practice_memberships, source: :user
  belongs_to :practice_lead, class_name: 'User', foreign_key: 'practice_lead_id'

  has_many :co_leads, -> { where(practice_memberships: { lead: true }) },
    through: :practice_memberships, source: :user

  scope :ordered, -> { order(:name) }
  scope :active, -> { where(active: 1) }

  def practice_lead_name
    practice_lead.full_name if practice_lead
  end

end
