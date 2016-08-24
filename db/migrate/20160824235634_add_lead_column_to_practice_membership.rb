class AddLeadColumnToPracticeMembership < ActiveRecord::Migration
  def change
    add_column :practice_memberships, :lead, :boolean, default: false
  end
end
