class AddLeadColumnToPracticeMembership < ActiveRecord::Migration
  def change
    add_column :memberships, :lead, :boolean, default: false
  end
end
