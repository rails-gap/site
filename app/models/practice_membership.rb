class PracticeMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :practice
end
