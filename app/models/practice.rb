class Practice < ActiveRecord::Base
  has_many :practice_memberships
  has_many :users, through: :practice_memberships

  has_many :leads, -> { where(practice_memberships: { lead: true }) },
    through: :practice_memberships, source: :user
  has_many :members, -> { where(practice_memberships: { lead: false }) },
    through: :practice_memberships, source: :user

  scope :ordered, -> { order(:name) }
  scope :active, -> { where(active: 1) }
end
