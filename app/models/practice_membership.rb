class PracticeMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :practice

  validates :user_id, presence: true
  validates :practice_id, presence: true
end
