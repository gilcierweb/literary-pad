class CreateStories < ActiveRecord::Migration[8.1]
  def change
    create_table :stories do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :cover_image
      t.integer :status
      t.integer :views_count
      t.integer :likes_count
      t.integer :comments_count
      t.datetime :published_at

      t.timestamps
    end
  end
end
