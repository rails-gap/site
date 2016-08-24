class PracticeMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :practice

  scope :leads, -> { where(lead: true) }
  scope :members, -> { where(lead: false) }
end
