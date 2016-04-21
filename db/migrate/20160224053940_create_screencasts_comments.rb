class CreateScreencastsComments < ActiveRecord::Migration
  def change
    create_table :screencasts_comments do |t|
      t.references :user, index: true
      t.text :content
      t.references :video, index: true

      t.timestamps null: false
    end
  end
end
