class CreateStories < ActiveRecord::Migration[8.1]
  def change
    create_table :stories do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :cover_image
      t.integer :status
      t.integer :views_count, default: 0
      t.integer :likes_count, default: 0
      t.integer :comments_count, default: 0
      t.datetime :published_at

      t.timestamps
    end

    add_index :stories, :status
    add_index :stories, :published_at
    add_index :stories, [:user_id, :status]
  end
end
