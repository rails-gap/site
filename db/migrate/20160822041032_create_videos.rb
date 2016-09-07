class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.references :user, index: true
      t.references :practice, index: true
      t.string :name
      t.string :url
      t.text :description
      t.boolean :active, default: true
      t.text :tags

      t.timestamps null: false
    end
  end
end
