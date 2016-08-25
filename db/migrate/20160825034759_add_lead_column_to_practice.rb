class AddLeadColumnToPractice < ActiveRecord::Migration
  def change
    add_column :practices, :practice_lead_id, :integer
  end
end
