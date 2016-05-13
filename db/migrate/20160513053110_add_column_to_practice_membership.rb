class AddColumnToPracticeMembership < ActiveRecord::Migration
  def change
    add_column :practice_memberships, :user_id, :integer
    add_column :practice_memberships, :practice_id, :integer
  end
end
