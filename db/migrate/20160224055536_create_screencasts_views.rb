class CreateScreencastsViews < ActiveRecord::Migration
  def change
    create_table :screencasts_views do |t|
      t.references :user, index: true
      t.references :video, index: true

      t.timestamps null: false
    end
  end
end
