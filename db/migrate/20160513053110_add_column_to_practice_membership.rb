class AddColumnToPracticeMembership < ActiveRecord::Migration
  def change
    add_column :memberships, :user_id, :integer
    add_column :memberships, :practice_id, :integer
  end
end
