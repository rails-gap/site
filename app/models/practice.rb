class Practice < ActiveRecord::Base
  has_many :practice_memberships
  has_many :users, through: :practice_memberships
end
