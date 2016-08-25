class Practice < ActiveRecord::Base
  has_many :memberships
  has_many :members, through: :memberships, source: :user
  belongs_to :practice_lead, class_name: 'User', foreign_key: 'practice_lead_id'

  has_many :co_leads, -> { where(memberships: { lead: true }) },
    through: :memberships, source: :user

  scope :ordered, -> { order(:name) }
  scope :active, -> { where(active: 1) }

  def practice_lead_name
    practice_lead.full_name if practice_lead
  end

end
