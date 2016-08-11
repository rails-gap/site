class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :employee_type, :string
    add_column :users, :location, :string
    add_column :users, :picture, :string
    add_column :users, :image, :string
    add_column :users, :active, :boolean, default: true
    add_column :users, :personnel_manager_id, :integer
    add_column :users, :position_id, :integer
    add_column :users, :level, :string
  end
end
