class CreateScreencastsVideos < ActiveRecord::Migration
  def change
    create_table :screencasts_videos do |t|
      t.references :user, index: true
      t.string :name
      t.string :url
      t.text :description
      t.boolean :active
      t.text :tags

      t.timestamps null: false
    end
  end
end
