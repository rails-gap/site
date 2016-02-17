# This migration comes from rop (originally 20160217024039)
class CreateRopCourses < ActiveRecord::Migration
  def change
    create_table :rop_courses do |t|
      t.string :code
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
