class CreatePracticeMemberships < ActiveRecord::Migration
  def change
    create_table :practice_memberships do |t|

      t.timestamps null: false
    end
  end
end
