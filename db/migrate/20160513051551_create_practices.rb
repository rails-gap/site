class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.string :name
      t.string :description
      t.string :icon

      t.timestamps null: false
    end
  end
end
